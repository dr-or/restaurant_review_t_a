class Client < ApplicationRecord
  has_many :reviews, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
