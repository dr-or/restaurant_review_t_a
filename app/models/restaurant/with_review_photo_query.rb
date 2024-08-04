class Restaurant::WithReviewPhotoQuery < ApplicationQuery
  def resolve
    @relation.joins(reviews: :images).distinct
  end
end
