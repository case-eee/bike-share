require 'csv'
require_relative '../app/models/station'
require_relative '../app/models/condition'
require_relative '../app/models/city'
require_relative '../app/models/trip'

def time_fix(date)
  date_split = date.split('/')
  date_split[0], date_split[1] , date_split[2] = date_split[2][0..3], date_split[0] , date_split[1]
  @time_parsed = date_split.join('/')
  @time_parsed
end

def import_station_csv
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|

    Station.write({name: row["name"],
                   lat: row["lat"],
                   long: row["long"],
                   dock_count: row["dock_count"],
                   city_name: row["city"],
                   installation_date: time_fix(row["installation_date"])})
  end
  puts "Imported Stations to Table."
end

def import_trip_csv
  Trip.delete_all
  CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|
    Trip.import({duration: row['duration'],
                start_date: time_fix(row['start_date']),
                start_station_name: row['start_station_name'],
                end_station_name: row['end_station_name'],
                end_date: time_fix(row['end_date']),
                bike_id: row['bike_id'],
                subscription_type: row['subscription_type'],
                zipcode: row['zip_code']})
  end
  puts 'Imported Trips to Table'
end

def import_conditions_csv
  CSV.foreach('db/csv/weather.csv', :headers=> true) do |row|

    date = row["date"]
    date_split = date.split('/')
    date_split[0], date_split[1] , date_split[2] = date_split[2], date_split[0] , date_split[1]
    time_parsed = date_split.join('/')

    Condition.write({ date: time_parsed,
                      events: row['events'],
                      max_temperature_f: row['max_temperature_f'],
                      mean_temperature_f: row['mean_temperature_f'],
                      min_temperature_f: row['min_temperature_f'],
                      max_dew_point_f: row['max_dew_point_f'],
                      mean_dew_point_f: row['mean_dew_point_f'],
                      min_dew_point_f: row['min_dew_point_f'],
                      max_humidity: row['max_humidity'],
                      mean_humidity: row['mean_humidity'],
                      min_humidity: row['min_humidity'],
                      max_sea_level_pressure_inches: row['max_sea_level_pressure_inches'],
                      mean_sea_level_pressure_inches: row['mean_sea_level_pressure_inches'],
                      min_sea_level_pressure_inches: row['min_sea_level_pressure_inches'],
                      max_visibility_miles: row['max_visibility_miles'],
                      mean_visibility_miles: row['mean_visibility_miles'],
                      min_visibility_miles: row['min_visibility_miles'],
                      max_wind_speed_mph: row['max_wind_Speed_mph'],
                      mean_wind_speed_mph: row['mean_wind_speed_mph'],
                      max_gust_speed_mph: row['max_gust_speed_mph'],
                      precipitation_inches: row['precipitation_inches'],
                      cloud_cover: row['cloud_cover'],
                      wind_dir_degrees: row['wind_dir_degrees'],
                      zip_code: row['zip_code']})
    
  end
    puts 'Imported Conditions to Table'
end

