#require 'CSV'
require 'smarter_csv'
require "sinatra/activerecord"
require './app/models/station'
require './app/models/city'
require './app/models/trip'

#create_stations
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
    City.create(name: row[5]) unless City.find_by(name: row[5])
    city = City.find_by(name: row[5])
    Station.create({name: row[1], dock_count: row[4], installation_date: row[6], city_id: city.id})
  end


#create_trips
  SmarterCSV.process('db/csv/trip.csv').each do |row|
    Trip.create(duration: row[:duration],
                start_date: row[:start_date],
                start_station: row[:start_station],
                start_station_id: row[:start_station_id],
                end_date: row[:end_date],
                end_station: row[:end_station],
                end_station_id: row[:end_station_id],
                bike_id: row[:bike_id],
                subscription_type: row[:subscription_type],
                zip_code: row[:zip_code])
  end

