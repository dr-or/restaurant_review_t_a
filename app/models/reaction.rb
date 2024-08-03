class Reaction < ApplicationRecord
  belongs_to :target, polymorphic: true, counter_cache: true
  belongs_to :client

  enum :reaction_type, like: 0, dislike: 1
end
