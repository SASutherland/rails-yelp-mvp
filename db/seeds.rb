# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Clearing the db..."
Restaurant.destroy_all

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  restaurant.save!
end

resaurants = Restaurant.all

resaurants.each do |restaurant|
  review = Review.new(
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    restaurant_id: restaurant.id
  )
  review.save!
end

puts "Done!"
