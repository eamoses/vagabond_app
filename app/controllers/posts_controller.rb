class PostsController < ApplicationController

  def new
    @city = City.find_by_id(params[:city_id])
    @post = Post.new

    render :new
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

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
