class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(current_user_id)
  end

  def update
    @user = User.find(current_user.id)
    @user.articles << article.find(:id)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:articles)
    end
end

rails g migration CreateArticlesUsersJoinTable

rails g migration RemovePrimersIdFromUsers
