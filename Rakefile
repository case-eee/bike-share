require "bundler"
Bundler.require

require "sinatra/activerecord/rake"
require File.expand_path('../config/environment',  __FILE__)

namespace :import do
  desc "Import Trips.csv to table"
  task :trips do
    create_trips
  end

  desc "Import Stations.csv to table"
  task :stations do
    create_stations
  end

  desc "Import Weather.csv to table"
  task :conditions do
    create_conditions
  end
end

def create_trips
  SmarterCSV.process('db/csv/trip.csv').each do |row|
    Trip.create(duration: row[:duration],
                start_date: Date.strptime(row[:start_date], "%m/%d/%Y"),
                start_station_name: row[:start_station_name],
                start_station_id: row[:start_station_id],
                end_date: Date.strptime(row[:end_date], "%m/%d/%Y"),
                end_station_name: row[:end_station_name],
                end_station_id: row[:end_station_id],
                bike_id: row[:bike_id],
                subscription_type: row[:subscription_type],
                zip_code: row[:zip_code])
  end
  puts "Imported Trips to Table."
end

def create_stations
  SmarterCSV.process('db/csv/station.csv').each do |row|
    Station.create(id: row[:id],
                   name: row[:name],
                   dock_count: row[:dock_count],
                   city: row[:city],
                   installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
  end
  puts "Imported Stations to Table."
end

def create_conditions
  SmarterCSV.process('db/csv/weather.csv') do |row|
    row = row.pop
    Condition.create(date: Date.strptime(row[:date], "%m/%d/%Y"),
                     max_temperature_f: row[:max_temperature_f],
                     mean_temperature_f: row[:mean_temperature_f],
                     min_temperature_f: row[:min_temperature_f],
                     mean_humidity: row[:mean_humidity],
                     mean_visibility_miles: row[:mean_visibility_miles],
                     mean_wind_speed_mph: row[:mean_wind_speed_mph],
                     precipitation_inches: row[:precipitation_inches],
                     zip_code: row[:zip_code])
  end
  puts "Imported Weather to Table"
end
