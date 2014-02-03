class ArticlesController < ApplicationController

  def index
    get_article_uids
    store_articles
    @articles = Article.all
  end



end
