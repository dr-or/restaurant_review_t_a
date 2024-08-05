class Restaurant::WithRatingQuery < ApplicationQuery
  def resolve(rating)
    rating = rating.to_i

    @relation.joins(:reviews).where(reviews: { rating: })
  end
end
