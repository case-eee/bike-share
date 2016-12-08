class Condition < ActiveRecord::Base
  self.primary_key = 'date'

  validates :date, :max_temperature_f, :mean_temperature_f, :min_temperature_f, :mean_humidity, :mean_visibility_miles, :max_wind_speed_mph, :precipitation_inches, presence: true
  has_many  :trips, :foreign_key => 'start_date'

  def self.make_range(attribute, increment)
    floor   = minimum(attribute)
    ceiling = maximum(attribute)
    range = []

    until floor >= (ceiling - increment)
      range << [floor, floor + increment]
      floor += increment
    end

    range << [floor, ceiling]
  end

  def self.chunk(attribute, increment)
    chunked = {}
    make_range(attribute, increment).each do |range|
      chunked[range] = where(attribute => range[0]...range[1])
    end
    chunked
  end

  def self.connect_condition_with_trips(attribute, increment)
    trips_in_range = {}
    chunk(attribute, increment).each do |range, conditions|
      trips_in_range[range] = conditions.joins(:trips).group(:start_date).count.values
    end
    trips_in_range
  end

  def self.ranges_with_trips(attribute, increment)
    final = {}
    connect_condition_with_trips(attribute, increment).each do |k, v|
      v.empty? ? final[k] = [0, 0, 0] : final[k] = [average_daily(v), maximum_daily(v), minimum_daily(v)]
    end
    final
  end

  def self.rides_by_temperature
    ranges_with_trips(:max_temperature_f, 10)
  end

  def self.rides_by_precipitation
    ranges_with_trips(:precipitation_inches, 0.5)
  end

  def self.rides_by_mean_wind_speed
    ranges_with_trips(:mean_wind_speed_mph, 4)
  end

  def self.rides_by_mean_visibility
    ranges_with_trips(:mean_visibility_miles, 4)
  end

  def self.average_daily(rides)
    (rides.reduce(:+)/(rides.length.to_f)).round(2)
  end

  def self.maximum_daily(rides)
    rides.max
  end

  def self.minimum_daily(rides)
    rides.min
  end

end
