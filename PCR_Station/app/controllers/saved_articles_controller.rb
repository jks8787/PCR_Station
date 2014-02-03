class SavedArticlesController < ApplicationController

	def create
    current_user.articles << Article.find(params[:article_id])
	end

end
