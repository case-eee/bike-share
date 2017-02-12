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

# date,max_temperature_f,mean_temperature_f,min_temperature_f,max_dew_point_f,mean_dew_point_f,
# min_dew_point_f,max_humidity,mean_humidity,min_humidity,max_sea_level_pressure_inches,
# mean_sea_level_pressure_inches,min_sea_level_pressure_inches,max_visibility_miles,
# mean_visibility_miles,min_visibility_miles,max_wind_speed_mph,mean_wind_speed_mph,
# max_gust_speed_mph,precipitation_inches,cloud_cover,events,wind_dir_degrees,zip_code

# SmarterCSV.process('db/csv/weather.csv').each do |row|
#   puts "row: #{row}"
#   row[:date] = Date.strptime(row[:date], '%m/%d/%Y')
#   Condition.create(row) if row[:zip_code] == 94107
# end

CSV.foreach('db/csv/trip.csv').each do |row|
  puts "trip row: #{row}"
  trip_start_date = Date.strptime(row[2], '%m/%d/%Y')
  trip_end_date = Date.strptime(row[5], '%m/%d/%Y')
  Trip.create({ id: row[0],
                duraction: row[1],
                start_date: trip_start_date,
                start_station_name: row[3],
                start_station_id: row[4],
                end_date: trip_end_date,
                end_station_name: row[6],
                end_station_id: row[7],
                bike_id: row[8],
                subscription_type: row[9],
                zip_code: row[10]
  })
end
#create_weathers
CSV.foreach('db/csv/weather.csv').each do |row|
  puts "weather row: #{row}"
  weather_date = Date.strptime(row[0], '%m/%d/%Y')
  if row[23] == 94107
    Condition.create({  date: weather_date,
                        max_temperature_f: row[1],
                        mean_temperature_f: row[2],
                        min_temperature_f: row[3],
                        max_dew_point_f: row[4],
                        mean_dew_point_f: row[5],
                        min_dew_point_f: row[6],
                        max_humidity: row[7],
                        mean_humidity: row[8],
                        min_humidity: row[9],
                        max_sea_level_pressure_inches: row[10],
                        mean_sea_level_pressure_inches: row[11],
                        min_sea_level_pressure_inches: row[12],
                        max_visibility_miles: row[13],
                        mean_visibility_miles: row[14],
                        min_visibility_miles: row[15],
                        max_wind_speed_mph: row[16],
                        mean_wind_speed_mph: row[17],
                        max_gust_speed_mph: row[18],
                        precipitation_inches: row[19],
                        cloud_cover: row[20],
                        events: row[21],
                        wind_dir_degrees: row[22],
                        zip_code: row[23]
    })
  end
end


# id,duration,start_date,start_station_name,start_station_id,end_date,end_station_name,end_station_id,bike_id,subscription_type,zip_code

# #create_conditions
# SmarterCSV.process('db/csv/trip.csv').each do |row|
#   row[:start_date] = Date.strptime(row[:start_date], '%m/%d/%Y')
#   row[:end_date] = Date.strptime(row[:end_date], '%m/%d/%Y')

#create_trips
#   Trip.create(duration: row[:duration],
#               start_date_time: row[:start_date],
#               start_date: row[:start_date],
#               start_station_id: row[:start_station_id],
#               end_date_time: row[:end_date],
#               end_date: row[:end_date],
#               end_station_id: row[:end_station_id],
#               bike_id: row[:bike_id],
#               subscription_type: row[:subscription_type],
#               zip_code: row[:zip_code])
# end

