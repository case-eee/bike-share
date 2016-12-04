require 'csv'
require_relative '../app/models/station'
require_relative '../app/models/city'

CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
  puts row[6]

  date = row[6]
  date_split = date.split('/')
  date_split[0], date_split[1] , date_split[2] = date_split[2], date_split[0] , date_split[1]
  @time_parsed = date_split.join('/')

  Station.write({name: row[1], lat: row[2], long: row[3], dock_count: row[4], city_name: row[5], installation_date: @time_parsed})

end
puts "Imported Stations to Table."
