class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def update
    user = User.find_by_id(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city)
  end
end
