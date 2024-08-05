class Restaurant::WithReviewPhotoQuery < ApplicationQuery
  def resolve(_param)
    @relation.joins(reviews: :images).distinct
  end
end
