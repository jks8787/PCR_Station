class ArticlesController < ApplicationController
  def index
    Article.fetch_from_api("polymerase chain reaction")
    @articles = Article.all
  end

end
