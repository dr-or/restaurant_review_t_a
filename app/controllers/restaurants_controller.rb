class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all

    restaurants = restaurants.with_review_photo if params[:review_photo]

    render json: { restaurants: }
  end
end
