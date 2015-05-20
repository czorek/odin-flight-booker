class Flight < ActiveRecord::Base
  validates :from_airport,   presence: true
  validates :to_airport,     presence: true
  validates :start_datetime, presence: true 
  validates :duration,       presence: true

  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport,   class_name: "Airport"

  def self.get_start_dates
    Flight.all.map{ |f| f.start_datetime.to_date }.uniq
  end

  def self.search(query)
    conditions = {}
    conditions[:from_airport_id] = query[:from_airport_id] unless query[:from_airport_id].blank?
    conditions[:to_airport_id]   = query[:to_airport_id]   unless query[:to_airport_id].blank?
    unless query[:start_datetime].blank?
      parsed_date = Date.parse(query[:start_datetime])
      conditions[:start_datetime]  = parsed_date.beginning_of_day..parsed_date.end_of_day
    end
    Flight.where(conditions)
  end
end

# Try the methods below, they can prove faster when implemented correctly


#   def self.search(attributes)
#     supported_filters = [:from_airport_id, :to_airport_id]
#     attributes.slice(*supported_filters).inject(self) do |scope, (key, value)|
#       value.present? ? scope.send(key, value) : scope
#     end  
#   end
# end

# def self.filter(attributes)
#     attributes.inject(self) do |scope, (key, value)|
#       return scope if value.blank?
#       case key.to_sym
#       when :id, :zip # direct search
#         scope.where(key => value)
#       when :city, :state # regexp search
#         scope.where(["#{key} ILIKE ?", "%#{value}%"])
#       when :order # order=field-(ASC|DESC)
#         attribute, order = value.split("-") 
#         scope.order("#{self.table_name}.#{attribute} #{order}")
#       else # unknown key (do nothing or raise error, as you prefer to)
#         scope
#       end 
#     end  
#   end