class ArticlesController < ApplicationController
  def index
    uids = Article.fetch_from_api("foo")
    @articles = Article.all
  end
end
