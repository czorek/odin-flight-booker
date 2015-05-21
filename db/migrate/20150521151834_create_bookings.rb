class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :passenger, index: true
      t.references :flight, index: true

      t.timestamps null: false
    end
    add_foreign_key :bookings, :passengers
    add_foreign_key :bookings, :flights
  end
end
