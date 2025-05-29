class FlightsController < ApplicationController
  def index
    @flights = Flight.search(search_params)

    if @flights.nil?
      @flights = Flight.take(4)
    elsif @flights.empty?
      flash.now[:notice] = "Sorry, we couldn't find any flights with those results. Here are some avaiable flights"
      @flights = Flight.take(4)
    else
      @flights
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :departure_time, :passengers)
  end
end
