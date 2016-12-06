require 'csv'
require_relative '../app/models/station'
require_relative '../app/models/city'
require_relative '../app/models/trip'

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

def import_trip_csv
  CSV.foreach('db/csv/test_trip.csv', :headers=> true) do |row|
  # require 'pry'; binding.pry
    Trip.write({duration: row['duration'],
                start_date: row['start_date'],
                start_station_id: row['start_station_id'],
                end_station_id: row['end_station_id'],
                end_date: row['end_date'],
                bike_id: row['bike_id'],
                subscription_type: row['subscription_type'],
                zipcode: row['zip_code']})
  end
  puts 'Imported Trips to Table'
end