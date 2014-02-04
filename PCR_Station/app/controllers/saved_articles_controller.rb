class SavedArticlesController < ApplicationController

	def create
    current_user.articles << Article.find(params[:article_id])
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Article was successfully saved.' }
    end
	end

end
