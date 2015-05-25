class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    session[:flight_id] = @flight.id
    if params[:passengers_number]
      params[:passengers_number].to_i.times do
        @booking.passengers.build
      end
    else
      @booking.passengers.build
    end
  end

  # TODO: fix adding passengers to a booking if they exist in the db already

  def create
    @booking = chosen_flight.bookings.build(bookings_params)
    @booking[:flight_id] = session[:flight_id]
    if @booking.valid?
      @booking.save
      @booking.passengers.each do |p|
        Passenger.find_or_create_by(email: p[:email])
      # p.name = params[:passengers_attributes][:name]
        # passenger = Passenger.find_by(email: p[:email])
        # if !passenger && p.valid?
        #   p.save
        # else
        #   @booking.passengers << passenger
        # end
      end
    else
      flash.now[:failure] = "Something went wrong."
    end
    redirect_to root_url
  end

  private

    def bookings_params
      params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
    end
end
