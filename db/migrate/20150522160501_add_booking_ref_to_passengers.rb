class AddBookingRefToPassengers < ActiveRecord::Migration
  def change
    add_reference :passengers, :bookings, index: true
  end
end
