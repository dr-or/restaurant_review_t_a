class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :with_review_photo, WithReviewPhotoQuery
end
