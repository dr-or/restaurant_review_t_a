class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all

    restaurants = restaurants.with_review_photo if params[:review_photo]
    restaurants = restaurants.with_average_bill(params[:average_bill]) if params[:average_bill]

    render json: { restaurants:, total: restaurants.size }
  end
end
