FactoryBot.define do
  factory :order do
    client
    restaurant
    price { 1 }
  end
end
