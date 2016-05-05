class UsersController < ApplicationController

  def index
    @cities = City.all
    @users = User.all
    render :index
  end

  def new
    @cities = City.all
    @user = User.new
    render :new
  end

  def create
    @cities = City.all
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @cities = City.all
    @user = User.find_by_id(params[:id])
    render :show
  end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
