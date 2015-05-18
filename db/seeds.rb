codes = ['NYC', 'LAX', 'WAW', 'ALW', 'WSZ', 'VLL', 'TLS', 'TYO','FSD', 'STI']

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from=Time.zone.now, to)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

codes.each do |code|
  Airport.create(code: code)
end

def random_to_airport(from_airport)
  Airport.all.select{ |a| a.id != from_airport }.map{ |a| a.id }.sample
end

2.times do
  Airport.all.each do |airport|
    Flight.create(from_airport_id: airport.id, to_airport_id: random_to_airport(airport.id),
                  start_datetime: rand_time(Time.zone.now + 2.weeks), 
                  duration: rand_in_range(7200, 32000))
  end
end