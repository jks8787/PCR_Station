class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:articles)
    end
end



