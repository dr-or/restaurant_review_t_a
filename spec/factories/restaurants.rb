FactoryBot.define do
  factory :restaurant do
    sequence(:title) { |n| "#{Faker::Restaurant.name} - #{n}" }
    address { Faker::Address.full_address }
  end
end
