require 'csv'
require_relative '../app/models/station'
require_relative '../app/models/city'

def import_station_csv
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|

    date = row["installation_date"]
    date_split = date.split('/')
    date_split[0], date_split[1] , date_split[2] = date_split[2], date_split[0] , date_split[1]
    time_parsed = date_split.join('/')

    Station.write({name: row["name"],
                   lat: row["lat"],
                   long: row["long"],
                   dock_count: row["dock_count"],
                   city_name: row["city"],
                   installation_date: time_parsed})
  end
  puts "Imported Stations to Table."
end