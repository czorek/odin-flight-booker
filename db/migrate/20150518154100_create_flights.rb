class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps null: false
    end
  end
end
