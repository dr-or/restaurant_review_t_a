class Comment < ApplicationRecord
  has_many :reactions, as: :target, dependent: :destroy

  belongs_to :review
  belongs_to :client
end
