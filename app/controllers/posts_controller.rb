class PostsController < ApplicationController

  def new
    @city = City.find_by_id(params[:city_id])
    @post = Post.new

    render :new
  end

  def edit
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])

    render :edit
  end

  def update
    city = City.find_by_id(params[:city_id])
    post = Post.find_by_id(params[:id])
    post.update(post_params)
    redirect_to city_post_path(city, post)
  end

  def create
    user = current_user
    post = Post.create(post_params)
    @city = City.find_by_id(params[:city_id])
    @city.posts.push(post)
    user.posts.push(post)

    if post.save
      redirect_to city_path(@city.id)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])

    render :show
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
