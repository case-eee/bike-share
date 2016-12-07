require "bundler"
Bundler.require
require 'smarter_csv'

require "sinatra/activerecord/rake"

require File.expand_path('../config/environment', __FILE__)


namespace :import do
  desc "Import station.csv to cities table"
  task :cities do
   create_cities
  end

  desc "Import station.csv to table"
  task :stations do
   create_stations
  end

  desc "Import station.csv to subscription_types table"
  task :subscription_types do
   create_subscription_types
  end

  desc "Import weather.csv to table"
  task :weather_conditions do
    create_weather_conditions
  end

  desc "Import trip.csv to table"
  task :trips do
    create_trips
  end

end

def create_cities
  cities = SmarterCSV.process('db/csv/station.csv').map do |row|
    row[:city]
  end.uniq

  cities.each do |city|
    City.create(name: city)
  end

  puts "Imported Cities to Table."
end

def create_stations
  def format_date(date)
    date = date.split("/").reverse
    date[1], date[2] = date[2], date[1]
    date = date.join("/")
    date
  end

  SmarterCSV.process('db/csv/station.csv').each do |row|
    row[:installation_date] = format_date(row[:installation_date])
    row[:city] = City.find_by(name: row[:city])
    Station.create(row)
  end

  puts "Imported Stations to Table."
end

def create_subscription_types
  subscription_types = SmarterCSV.process('db/csv/trip.csv').map do |row|
    row[:subscription_type]
  end.uniq

  subscription_types.each do |subscription_type|
    SubscriptionType.create(subscription_type: subscription_type)
  end

  puts "Imported Subscription Types to Table."
end

def create_weather_conditions
  def format_date(date)
    date = date.split("/").reverse
    date[1], date[2] = date[2], date[1]
    date = date.join("/")
    date
  end

  SmarterCSV.process('db/csv/weather.csv',
                    key_mapping: {date: :date,
                                  max_temperature_f: :max_temperature_f,
                                  mean_temperature_f: :mean_temperature_f,
                                  min_temperature_f: :min_temperature_f,
                                  mean_humidity: :mean_humidity,
                                  mean_visibility_miles: :mean_visibility_miles,
                                  mean_wind_speed_mph: :mean_wind_speed_mph,
                                  precipitation_inches: :precipitation_inches,
                                  zip_code: :zip_code},
                    remove_unmapped_keys: true).each do |row|
    row[:date] = format_date(row[:date])
    row[:precipitation_inches] = row[:precipitation_inches].to_f
    WeatherCondition.create(row)
  end

  puts "Imported Weather Conditions to Table."
end

def create_trips
  def format_date(date)
    date = date.split("/").reverse
    date[1], date[2] = date[2], date[1]
    date = date.join("/")
    date
  end

  def time(datetime)
    datetime.split(" ").last
  end

  def date(datetime)
    format_date(datetime.split(" ").first)
  end

  SmarterCSV.process('db/csv/trip.csv',
                    key_mapping: {duration: :duration,
                                  start_date: :start_date,
                                  start_station_name: :start_station_id,
                                  end_date: :end_date,
                                  end_station_name: :end_station_id,
                                  bike_id: :bike_id,
                                  subscription_type: :subscription_type,
                                  zip_code: :user_zip_code},
                    remove_unmapped_keys: true).each do |row|
    row[:start_time] = time(row[:start_date])
    row[:start_date] = date(row[:start_date])
    row[:end_time]   = time(row[:end_date])
    row[:end_date]   = date(row[:end_date])
    row[:subscription_type] = SubscriptionType.find_by(subscription_type: row[:subscription_type])
    ss = Station.find_by(name: row[:start_station_id])
    row[:start_station_id] = ss.id if ss
    es = Station.find_by(name: row[:end_station_id])
    row[:end_station_id] = es.id if es
    Trip.create(row)
  end

  puts "Imported Trips to Table."
end

namespace :database do
    desc "Correction of sequences id"
    task :correction_seq_id do
        ActiveRecord::Base.connection.tables.each do |t|
            ActiveRecord::Base.connection.reset_pk_sequence!(t)
        end
    end
end
