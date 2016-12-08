require 'pry'
class Condition < ActiveRecord::Base
  validates :date,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :mean_humidity,
            :mean_visibility_miles,
            :mean_wind_speed_mph,
            :precipitation_inches,
            presence: true
  validates :zip_code, numericality: {equal_to: 94107}

  has_many :trips, primary_key: :date, foreign_key: :start_date


  def self.trips_per_day
    Trip.group(:start_date).count
  end

  def self.max_temperature_range(base_temp)
    where(max_temperature_f: base_temp...(base_temp + 10))
  end

  def self.trips_in_temperature_range(base_temp)
    found = []
    Condition.max_temperature_range(base_temp).find_each do |trip|
      found << Trip.where(start_date: trip.date).count
    end
      average = found.reduce(:+) / found.count
      max = found.max
      min = found.min
      Struct.new("Temperature", :average, :max, :min)
      Struct::Temperature.new(average, max, min)
  end

  def self.precipitation_in_half_inch_increments(precipitation)
    where(precipitation_inches: precipitation...(precipitation + 0.5))
  end

  def self.trips_in_precipitation_range(base_range)
    found = []
    Condition.precipitation_in_half_inch_increments(base_range).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    average = found.reduce(:+) / found.count
    max = found.max
    min = found.min
    Struct.new("Precipitaion", :average, :max, :min)
    Struct::Precipitaion.new(average, max, min)

  end

  def self.wind_speed_in_4_mph_chunks(base_speed)
    where(mean_wind_speed_mph: base_speed...(base_speed + 4))
  end

  def self.trips_in_wind_speed_range(base_speed)
    found = []
    Condition.wind_speed_in_4_mph_chunks(base_speed).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    average = found.reduce(:+) / found.count
    max = found.max
    min = found.min
    Struct.new("Wind", :average, :max, :min)
    Struct::Wind.new(average, max, min)

  end

  def self.visibility_in_4_mile_range(base_range)
    where(mean_visibility_miles: base_range...(base_range + 4))
  end

  def self.trips_with_visibility_in_4_mile_range(base_range)
    found = []
    Condition.visibility_in_4_mile_range(base_range).find_each do |trip|
        found << Trip.where(start_date: trip.date).count
    end
    average = found.reduce(:+) / found.count
    max = found.max
    min = found.min
    Struct.new("Visibility", :average, :max, :min)
    Struct::Visibility.new(average, max, min)
  end

  def self.weather_on_day_with_highest_rides
    Condition.where(date: trips_per_day.key(trips_per_day.values.max))
  end

  def self.weather_on_day_with_least_rides
    Condition.where(date: trips_per_day.key(trips_per_day.values.min))
  end

end
