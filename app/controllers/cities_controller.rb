class CitiesController < ApplicationController

  def index
    @cities = City.all

    render :index
  end

  def show

    @city = City.find_by_id(params[:id])
    @posts = @city.posts.all

    render :show
  end
end
