class Airport < ApplicationRecord
  has_many :arrivals, foreign_key: :arrival_airport_id, class_name: "Flight"
  has_many :departures, foreign_key: :departure_airport_id, class_name: "Flight"
end
