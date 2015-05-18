class Airport < ActiveRecord::Base
  validates :code, presence: true, uniqueness: { case_sensitive: false },
                                   length:     { is: 3 }
  before_save :uppercase_code
  has_many :departing_flights, foreign_key: :from_airport_id, class_name: "Flight"
  has_many :arriving_flights,  foreign_key: :to_airport_id,   class_name: "Flight"

  def uppercase_code
    self.code.upcase!
  end
end
