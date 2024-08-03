class Order < ApplicationRecord
  has_many :tips, dependent: :destroy

  belongs_to :client
  belongs_to :restaurant
end
