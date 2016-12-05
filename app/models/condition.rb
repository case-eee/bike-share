class Condition < ActiveRecord::Base

  validates :date,
            :events,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :max_dew_point_f,
            :mean_dew_point_f,
            :min_dew_point_f,
            :max_humidity,
            :mean_humidity,
            :min_humidity,
            :max_sea_level_pressure_inches,
            :mean_sea_level_pressure_inches,
            :min_sea_level_pressure_inches,
            :max_visibility_miles,
            :mean_visibility_miles,
            :min_visibility_miles,
            :max_wind_speed_mph,
            :mean_wind_speed_mph,
            :min_wind_speed_mph,
            :precipitation_inches,
            :cloud_cover,
            :wind_dir_degrees,
            :zip_code, presence: true

  def self.write(condition_details)
    self.find_or_create_by(condition_details)
  end

end