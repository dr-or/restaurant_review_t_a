class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reactions, as: :target, dependent: :destroy
  has_many :images, as: :target, dependent: :destroy

  belongs_to :restaurant
  belongs_to :client

  validates :rating, inclusion: { in: [*1..5], allow_blank: true }
end
