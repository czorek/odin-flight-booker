codes = ['NYC', 'LAX', 'WAW', 'ALW', 'WSZ', 'VLL', 'TLS', 'TYO','FSD', 'STI',
         'ACY', 'BAU', 'BJS', 'CTA', 'DYG']

dates = (Date.today.to_date..(Date.today+30.days).to_date)

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_date(from=Time.zone.now, to)
  Time.at(rand_in_range(from.to_f, to.to_f)).to_date
end

def random_hour
  (Date.today + rand(0..24).hour + rand(0..60).minutes).to_datetime
end

def airport_ids
  Airport.all.map { |a| a.id }
end

codes.each do |code|
  Airport.create(code: code)
end

dates.each do |date|
  Airport.all.each do |airport|
    2.times do
      airport_id_a = [airport.id]
      Flight.create(from_airport_id: airport.id,
                    to_airport_id:   (airport_ids - airport_id_a).sample,
                    start_datetime:  (date+rand(0..24).hours),
                    duration:        rand_in_range(7200, 32000))
    end
  end
end