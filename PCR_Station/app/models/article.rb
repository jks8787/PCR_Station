require 'net/http'
require 'open-uri'

class Article < ActiveRecord::Base
	belongs_to :user

	def self.fetch_from_api(term)
		uid_url = URI.parse URI.escape("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=polymerase chain reaction[mesh]+AND+real time polymerase chain reaction[mesh]+AND+2014[pdat]&usehistory=y")

		uid_xml_data = Net::HTTP.get_response(uid_url).body
		uid_array = []

		uid_xml = Nokogiri::XML(uid_xml_data)

		uid_xml.xpath("//Id").each do |uid|
  		uid_array << uid.content
		end

		get_articles_info(uid_array)
	end

	private

	def self.get_articles_info(uid_array)
		article_array = []
		uid_array.each do |article_uid|
			article_url = URI.parse("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=#{article_uid}")
			article_xml_data = Net::HTTP.get_response(article_url).body
			article_xml = Nokogiri::XML(article_xml_data)

			article_hash = {title: nil, author: nil, uid: nil}

			article_hash[:title] = article_xml.xpath("//Item[@Name='Title']").first.content
			article_hash[:author] = article_xml.xpath("//Item[@Name='LastAuthor']").first.content
			article_hash[:uid] = article_uid
			article_array << article_hash
		end
		store_articles(article_array)
	end

	def self.store_articles(article_array)
		article_array.each do |article|
			Article.create(title: article[:title], author: article[:author], uid: article[:uid])
		end
	end
end
