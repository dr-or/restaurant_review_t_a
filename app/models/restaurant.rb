class Restaurant < ApplicationRecord
  OPERATORS = {
    more: '>',
    less: '<',
    eq: '='
  }.freeze

  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :with_review_photo, WithReviewPhotoQuery
  scope :with_average_bill, WithAverageBillQuery
  scope :with_rating, WithRatingQuery
  scope :with_tips_count, WithTipsCountQuery
end
