class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  def formatted_date
    departure_time.strftime("%B %d, %Y")
  end

  def self.populate_flights(search_criteria)
    self.where(departure_airport_id: search_criteria[:departure_airport_id])
        .where(arrival_airport_id: search_criteria[:arrival_airport_id])
        .where(departure_time: search_criteria[:departure_time])
  end

  def self.search(passed_params)
    if passed_params.present?
      populate_flights(passed_params)
    else
      nil
    end
  end
end
