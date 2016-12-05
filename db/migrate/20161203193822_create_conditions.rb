class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.datetime :date
      t.integer :max_temperature_f
      t.integer :mean_temperature_f
      t.integer :min_temperature_f
      t.integer :mean_humidity
      t.integer :mean_wind_speed_mph
      t.integer :precipitation_inches
      t.integer :max_dew_point_f
      t.integer :mean_dew_point_f
      t.integer :min_dew_point_f
      t.integer :max_humidity
      t.integer :min_humidity
      t.integer :max_sea_level_pressure_inches
      t.integer :min_sea_level_pressure_inches
      t.integer :mean_sea_level_pressure_inches
      t.integer :max_visibility_miles
      t.integer :min_visibility_miles
      t.integer :max_gust_speed_mph
      t.integer :max_wind_speed_mph
      t.integer :cloud_cover
      t.integer :wind_dir_degrees
      t.integer :zip_code
      t.integer :mean_visibility_miles
      t.string  :events

      t.timestamps null: false
    end
  end
end
