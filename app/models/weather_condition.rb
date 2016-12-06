class WeatherCondition < ActiveRecord::Base
  self.primary_key = "date"

  validates :date,
            :max_temperature_f,
            :mean_temperature_f,
            :min_temperature_f,
            :mean_humidity,
            :mean_visibility_miles,
            :mean_wind_speed_mph,
            :precipitation_inches,
            :zip_code,
            presence: true

  validates :zip_code, inclusion: { in: [94107]}

  has_many :trips, :foreign_key => :start_date
end
