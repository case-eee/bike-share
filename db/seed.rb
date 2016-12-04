#require 'CSV'
require 'smarter_csv'
require "sinatra/activerecord"
require './app/models/station'
require './app/models/city'
require './app/models/trip'
require 'pry'

#create_stations
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
    City.create(name: row[5]) unless City.find_by(name: row[5])
    city = City.find_by(name: row[5])
    Station.create({name: row[1], dock_count: row[4], installation_date: row[6], city_id: city.id})
  end


#create_trips
  SmarterCSV.process('db/csv/trip.csv').each do |row|
    Trip.create(duration: row[:duration],
                start_date: format(row[:start_date]),
                start_station_id: row[:start_station_id],
                end_date: format(row[:end_date]),
                end_station_id: row[:end_station_id],
                bike_id: row[:bike_id],
                subscription_type: row[:subscription_type],
                zip_code: row[:zip_code])
  end

  def format(time)
    DateTime.strptime(time, '%m/%d/%Y %H:%M').strftime('%Y/%m/%d %H:%M:%S').to_s
  end

