FactoryBot.define do
  factory :tip do
    client
    order
    amount { 1 }
  end
end
