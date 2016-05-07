class CitiesController < ApplicationController

  def index
    @cities = City.all

    render :index
  end

  def new
    @cities = City.new

    render :new
  end

  def show
    @city = City.friendly.find(params[:id])
    @posts = @city.posts.all

    render :show
  end

end
