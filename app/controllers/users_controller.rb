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
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end


  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts.all
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
