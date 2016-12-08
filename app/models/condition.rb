require_relative "date_formater"

class Condition < ActiveRecord::Base
  include DateFormat
  has_many :trips, class_name: "Trip", primary_key: "date", foreign_key: "start_date"

  validates :date,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :mean_humidity,
            :mean_visibility_miles,
            :max_wind_speed_mph,
            :precipitation_inches,
              presence: true

  def self.write(condition_details)
    find_or_create_by(condition_details)
  end

  def self.days_with_high_temps_in(range)
    where(max_temperature_f: range)
  end

  def self.grouped_by_date_number_of_trips
    joins(:trips).group(:date).count("id")
  end

  def self.grouped_days_in_range_max_temp(range)
    days_with_high_temps_in(range).joins(:trips).group(:date).count("id")
  end

  def self.average_number_of_rides_in_range_max_temp(range)
    (grouped_days_in_range_max_temp(range).values.reduce(:+).to_f / grouped_days_in_range_max_temp(range).values.count).round(2)
  end

  def self.highest_number_of_rides_in_range_max_temp(range)
    grouped_days_in_range_max_temp(range).values.sort.last
  end

  def self.lowest_number_of_rides_in_range_max_temp(range)
    grouped_days_in_range_max_temp(range).values.sort.first
  end

  def self.days_with_precipitation_in(range)
    where(precipitation_inches: range)
  end

  def self.grouped_days_in_range_precip(range)
    days_with_precipitation_in(range).joins(:trips).group(:date).count("id")
  end

  def self.average_number_of_rides_in_range_precip(range)
    (grouped_days_in_range_precip(range).values.reduce(:+).to_f / grouped_days_in_range_precip(range).values.count).round(2)
  end

  def self.highest_number_of_rides_in_range_precip(range)
    grouped_days_in_range_precip(range).values.sort.last
  end

  def self.lowest_number_of_rides_in_range_precip(range)
    grouped_days_in_range_precip(range).values.sort.first
  end

  def self.days_with_mean_wind_speed_in(range)
    where(mean_wind_speed_mph: range)
  end

  def self.grouped_days_in_range_wind(range)
    days_with_mean_wind_speed_in(range).joins(:trips).group(:date).count("id")
  end

  def self.average_number_of_rides_in_range_wind(range)
    (grouped_days_in_range_wind(range).values.reduce(:+).to_f / grouped_days_in_range_wind(range).values.count).round(2)
  end

  def self.highest_number_of_rides_in_range_mean_wind_speed(range)
    grouped_days_in_range_wind(range).values.sort.last
  end

  def self.lowest_number_of_rides_in_range_mean_wind_speed(range)
    grouped_days_in_range_wind(range).values.sort.first
  end

  def self.days_with_visibility_between(range)
    where(mean_visibility_miles: range)
  end

  def self.grouped_days_in_range_mean_visibility(range)
    days_with_visibility_between(range).joins(:trips).group(:date).count("id")
  end

  def self.average_number_of_rides_in_mean_visibility(range)
    (grouped_days_in_range_mean_visibility(range).values.reduce(:+).to_f / grouped_days_in_range_mean_visibility(range).values.count).round(2)
  end

  def self.highest_number_of_rides_in_mean_visibility(range)
    grouped_days_in_range_mean_visibility(range).values.sort.last
  end

  def self.lowest_number_of_rides_in_mean_visibility(range)
    grouped_days_in_range_mean_visibility(range).values.sort.first
  end

  def self.day_with_highest_number_of_rides
    find_by(date: grouped_by_date_number_of_trips.key(grouped_by_date_number_of_trips.values.max))
  end

  def self.day_with_lowest_number_of_rides
    find_by(date: grouped_by_date_number_of_trips.key(grouped_by_date_number_of_trips.values.min))
  end


end
