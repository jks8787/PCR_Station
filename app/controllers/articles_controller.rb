class ArticlesController < ApplicationController
  def index
    Article.fetch_from_api()
    @articles = Article.order(created_at: :desc).limit(20)
  end

end
