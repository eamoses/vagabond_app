class PostsController < ApplicationController

  def new
    @city = City.friendly.find(params[:city_id])
    @post = Post.new
    render :new
  end

  def edit
    session[:return_to] ||= request.referer
    @city = City.friendly.find(params[:city_id])
    @post = Post.find_by_id(params[:id])

    if current_user == @post.user
      render :edit
    else
      flash[:error] = "You can only edit your own posts"
      redirect_to root_path
    end
  end

  def update
    city = City.friendly.find(params[:city_id])
    post = Post.find_by_id(params[:id])
    post.update(post_params)

    redirect_to session.delete(:return_to)
  end

  def create
    user = current_user
    post = Post.create(post_params)
    @city = City.friendly.find(params[:city_id])
    @city.posts.push(post)
    user.posts.push(post)

    if post.save
      redirect_to city_path(@city.id)
    else
      flash[:error] = post.errors.full_messages.to_sentence
      redirect_to new_post_path(post[:city_id])
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @city = City.friendly.find(params[:city_id])

    render :show
  end

  def destroy
    post = Post.find_by_id(params[:id])
    post.destroy
    if post.destroy
      flash[:notice] = "Post deleted."
      redirect_to city_path(params[:city_id])
    else
      flash[:error] = post.erroes.full_messages_to_sentence
      redirect_to edit_post_path(post.city, post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
