# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'factory_bot_rails'
include FactoryBot::Syntax::Methods
Rails.application.eager_load!

# Create 100 cinema records
100.times do
  FactoryBot.create(:cinema)
end

# Create 100 movie records with associated cinemas
100.times do
  create(:movie)
end
