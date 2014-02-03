require 'net/http'
require 'open-uri'
cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 60.minutes)
class Article < ActiveRecord::Base
	has_and_belongs_to_many :user
	validates :uid, uniqueness: true

	def self.fetch_from_api
		uid_array = Rails.cache.fetch('esearch') do
			uid_url = URI.parse URI.escape("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=polymerase chain reaction[mesh]+AND+real time polymerase chain reaction[mesh]+AND+2014[pdat]&usehistory=y")
			uid_xml_data = Net::HTTP.get_response(uid_url).body
			uid_xml = Nokogiri::XML(uid_xml_data)
			uid_xml.xpath("//Id").map(&:content)
		end

		articles = get_articles_info(uid_array)
		store_articles(articles)
	end

	def self.get_articles_info(uid_array)
		Rails.cache.fetch('esummary') do
			uid_array.map do |article_uid|
				article_url = URI.parse("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{article_uid}")
				article_xml_data = Net::HTTP.get_response(article_url).body
				article_xml = Nokogiri::XML(article_xml_data)

				{
					title: article_xml.xpath("//Item[@Name='Title']").first.content,
					author: article_xml.xpath("//Item[@Name='LastAuthor']").first.content,
					uid: article_uid
				}
			end
		end
	end

	def self.store_articles(article_array)
		article_array.each do |article|
			Article.create(title: article[:title], author: article[:author], uid: article[:uid])
		end
	end
end
