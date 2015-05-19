class Flight < ActiveRecord::Base
  validates :from_airport, presence: true
  validates :to_airport, presence: true
  validates :start_datetime, presence: true 
  validates :duration, presence: true

  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.get_start_datetimes
    Flight.all.collect{ |f| f.start_datetime.to_date }.uniq
  end

  def self.search(query)
    where("from_airport_id LIKE ? AND to_airport_id LIKE ?",
          "#{query[:from_airport_id]}", "#{query[:to_airport_id]}")
  end

end
