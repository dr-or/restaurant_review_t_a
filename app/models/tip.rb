class Tip < ApplicationRecord
  belongs_to :order
  belongs_to :client
end
