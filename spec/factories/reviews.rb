FactoryBot.define do
  factory :review do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph_by_chars }
    restaurant
    client
  end
end
