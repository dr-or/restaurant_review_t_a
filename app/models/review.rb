class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reactions, as: :target, dependent: :destroy

  belongs_to :restaurant
  belongs_to :client
end
