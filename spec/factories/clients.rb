FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    sequence(:phone) { |n| "#{Faker::PhoneNumber.unique.subscriber_number(length: 6)}#{n}" }
  end
end
