class SavedArticlesController < ApplicationController

	def update
    @user = User.find(current_user.id)
    @user.articles << article.find(:id)
	end

end
