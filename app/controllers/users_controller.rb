class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
