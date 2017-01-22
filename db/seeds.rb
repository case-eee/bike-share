require 'csv'
require 'smarter_csv'
require "sinatra/activerecord"
require './app/models/station'
require './app/models/city'
require './app/models/trip'
require './app/models/condition'
require 'pry'

#create_stations
CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
  city = City.find_or_create_by(name: row[5])
  installation_date = Date.strptime(row[6], '%m/%d/%Y')
  Station.create({id: row[0],
                  name: row[1],
                  lat: row[2],
                  long: row[3],
                  dock_count: row[4], 
                  installation_date: installation_date, 
                  city_id: city.id})
end

#create_weathers
SmarterCSV.process('db/csv/weather.csv').each do |row|
  puts "row: #{row}"
  row[:date] = Date.strptime(row[:date], '%m/%d/%Y')
  Condition.create(row) if row[:zip_code] == 94107
end

#create_conditions
SmarterCSV.process('db/csv/trip.csv').each do |row|
  row[:start_date] = Date.strptime(row[:start_date], '%m/%d/%Y')
  row[:end_date] = Date.strptime(row[:end_date], '%m/%d/%Y')

#create_trips
  Trip.create(duration: row[:duration],
              start_date_time: row[:start_date],
              start_date: row[:start_date],
              start_station_id: row[:start_station_id],
              end_date_time: row[:end_date],
              end_date: row[:end_date],
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription_type: row[:subscription_type],
              zip_code: row[:zip_code])
end

