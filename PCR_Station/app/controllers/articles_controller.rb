class ArticlesController < ApplicationController

  def index
    uids = Article.fetch_uids
    binding.pry
    store_articles
    @articles = Article.all
  end



end
