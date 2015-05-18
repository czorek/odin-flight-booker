codes = ['NYC', 'LAX', 'WAW', 'ALW', 'WSZ', 'VLL', 'TLS', 'TYO','FSD', 'STI']

codes.each do |code|
  Airport.create(code: code)
end