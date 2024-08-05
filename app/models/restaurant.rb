class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :with_review_photo, WithReviewPhotoQuery
  scope :with_average_bill, WithAverageBillQuery[self] # rubocop:disable Rails/ScopeArgs
  scope :with_rating, WithRatingQuery[self] # rubocop:disable Rails/ScopeArgs
end
