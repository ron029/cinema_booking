# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'factory_bot_rails'
# include FactoryBot::Syntax::Methods
# Rails.application.eager_load!

# c = User.new(full_name: "Administrator", email: "admin@admin.com", mobile_number: "09999999999", password: "foobar", password_confirmation: "foobar", admin: "1")
# c.save
# b = User.new(full_name: "Ron Mark Bonifacio", email: "bonifacioronmark@gmail.com", mobile_number: "09999999999", password: "foobar", password_confirmation: "foobar")
# b.save
# Create 100 cinema records
# 20.times do
#   FactoryBot.create(:cinema)
# end

# # Create 100 movie records with associated cinemas
# 30.times do
#   create(:movie)
# end
# fully_booked_cinemas = Cinema.where(availability: 0)

# # Iterate through each cinema and check the number of bookings
# fully_booked_cinemas.each do |cinema|
#   if cinema.bookings.count < 10
#     # If the booking count is less than 10, update the "availability" to "available"
#     cinema.update(availability: 1)
#   end
# end
# cinemas_data = []
# 20.times do
#   cinemas_data << { name: Faker::Company.name, availability: ['Fully Booked', 'Available'].sample }
# end

# Cinema.create!(cinemas_data)

# # Seed Movies
# movies_data = []
# 30.times do
#   cinema = Cinema.all.sample
#   movies_data << { name: Faker::Movie.title, cinema: cinema }
# end

# Movie.create!(movies_data)

# Movie.destroy_all