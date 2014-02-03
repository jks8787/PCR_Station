class ArticlesController < ApplicationController
  def index
    Article.fetch_from_api
    @articles = Article.all
  end

end
