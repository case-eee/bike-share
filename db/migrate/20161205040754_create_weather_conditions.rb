class CreateWeatherConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_conditions, id: false do |t|
      t.date :date
      t.integer :max_temperature_f
      t.integer :mean_temperature_f
      t.integer :min_temperature_f
      t.integer :mean_humidity
      t.integer :mean_visibility_miles
      t.integer :mean_wind_speed_mph
      t.float :precipitation_inches

      t.timestamps null: false
    end
  end
end
