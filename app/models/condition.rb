class Condition < ActiveRecord::Base

  validates :date,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :mean_humidity,
            :mean_visibility_miles,
            :max_wind_speed_mph,
            :precipitation_inches, presence: true

  def self.write(condition_details)
    self.find_or_create_by(condition_details)
  end

end