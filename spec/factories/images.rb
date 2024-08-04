FactoryBot.define do
  factory :image do
    association :target, factory: :review
    url { Faker::Internet.url }
    sequence(:md5) { |n| "#{Faker::Internet.uuid}-#{n}" }
  end
end
