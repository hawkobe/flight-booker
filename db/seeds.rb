# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require 'faker'

15.times do
  Airport.create(
    name: Faker::Travel::Airport.unique.iata(size: 'large', region: 'united_states')
  )
end

20.times do
  Flight.create(
    departure_airport_id: Airport.all.sample(1).first.id,
    arrival_airport_id: Airport.all.sample(1).first.id,
    departure_time: Faker::Date.between(from: '2025-06-23', to: '2025-12-25'),
    duration: "#{rand(2...10)} hours"
  )
end
