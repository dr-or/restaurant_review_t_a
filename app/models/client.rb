class Client < ApplicationRecord
  has_many :reviews, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :tips, dependent: :destroy
end
