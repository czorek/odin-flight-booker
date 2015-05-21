class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers = []
    if params[:passengers_number]
      params[:passengers_number].to_i.times do
        @passengers << Passenger.new 
      end
    else
      @passengers << Passenger.new
    end
  end

  def create
  end
end
