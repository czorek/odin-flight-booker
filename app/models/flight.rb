class Flight < ActiveRecord::Base
  validates :from_airport, presence: true
  validates :to_airport, presence: true
  validates :start_datetime, presence: true 
  validates :duration, presence: true
  
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
end
