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

  def self.max_temperature_range(base_temp)
    where(max_temperature_f: base_temp...(base_temp + 10))
  end

  def self.average_max_temp_trips(base_temp)
    # dates = Condition.max_temperature_range(base_temp).map {|c| c.date}
    # trip_dates = dates.map {|d| Trip.where(start_date: d)}
    # trip_count = trip_dates.map {|c| c.count}
    # avg = (trip_count.reduce(:+) / trip_count.count)
    # avg
    found = []
    Condition.max_temperature_range(base_temp).find_each do |trip|
      found << Trip.where(start_date: trip.date)
    end
    found
  end

  def self.highest_max_temp_trips(base_temp)
    dates = Condition.max_temperature_range(base_temp).map {|c| c.date}
    trip_dates = dates.map {|d| Trip.where(start_date: d)}
    trip_count = trip_dates.map {|c| c.count}
    trip_count.max
  end

  def self.lowest_max_temp_trips(base_temp)
    dates = Condition.max_temperature_range(base_temp).map {|c| c.date}
    trip_dates = dates.map {|d| Trip.where(start_date: d)}
    trip_count = trip_dates.map {|c| c.count}
    trip_count.min
  end
  def self.precipitation_in_half_inch_increments(precipitation)
    where(precipitation_inches: precipitation...(precipitation + 0.5)).ids
  end

  def self.wind_speed_in_4_mph_chunks(base_speed)
    where(mean_wind_speed_mph: base_speed...(base_speed + 4)).ids
  end

  def self.visibility_in_4_mile_chunks(base_visibility)
    where(mean_visibility_miles: base_visibility...(base_visibility + 4)).ids
  end
end
