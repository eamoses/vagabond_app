class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :add_cities

  def add_cities
    @cities = City.all
  end

  def application
    render :application
  end

end
