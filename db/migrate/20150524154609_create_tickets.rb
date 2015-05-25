class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :passenger, index: true
      t.references :booking, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :passengers
    add_foreign_key :tickets, :bookings
  end
end
