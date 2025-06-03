class BookingsController < ApplicationController
  def new
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_option])
    @booking = @flight.bookings.build
    params[:passengers].to_i.times do
      @booking.passengers.build
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: "Flight booked!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
