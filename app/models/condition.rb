class Condition < ActiveRecord::Base
  validates :date, :max_temperature_f, :mean_temperature_f, :min_temperature_f,
            :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph,
            :precipitation_inches, presence: true

end
