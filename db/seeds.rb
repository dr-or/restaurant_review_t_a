# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
RESTAURANTS_COUNT = 5
CLIENTS_COUNT = 50
REVIEWS_COUNT = 100
COMMENTS_COUNT = 200
REACTIONS_COUNT = 400

RESTAURANTS_COUNT.times do
  Restaurant.create(
    title: Faker::Restaurant.unique.name,
    address: Faker::Address.full_address
  )
end

CLIENTS_COUNT.times do
  Client.create(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.unique.subscriber_number(length: 9),
    email: Faker::Internet.unique.email
  )
end

restaurant_ids = Restaurant.pluck(:id)
client_ids = Client.pluck(:id)

REVIEWS_COUNT.times do
  Review.create(
    restaurant_id: restaurant_ids.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph_by_chars,
    client_id: client_ids.sample
  )
end

reviews = Review.all

COMMENTS_COUNT.times do
  Comment.create(
    review: reviews.sample,
    body: Faker::Lorem.paragraph_by_chars,
    client_id: client_ids.sample
  )
end

comments = Comment.all
targets = reviews + comments

REACTIONS_COUNT.times do
  Reaction.create(
    target: targets.sample,
    client_id: client_ids.sample,
    reaction_type: rand(2)
  )
end
