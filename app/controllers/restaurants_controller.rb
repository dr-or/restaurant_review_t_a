class RestaurantsController < ApplicationController
  SCOPES = {
    review_photo: :with_review_photo,
    average_bill: :with_average_bill,
    rating: :with_rating,
    tips: :with_tips_count
  }.freeze

  def index
    restaurants = Restaurant.all

    params.slice(:review_photo, :average_bill, :rating, :tips).each do |key, value|
      restaurants = restaurants.send(SCOPES[key.to_sym], value)
    end

    render json: { restaurants:, total: restaurants.size }
  end
end
