class Conditions < ActiveRecord::Migration[5.0]
  def change
    create_table 'conditions' do |t|
      t.date    :date
      t.integer :max_temperature_f
      t.integer :mean_temperature_f
      t.integer :min_temperature_f
      t.integer :max_dew_point_f
      t.integer :mean_dew_point_f
      t.integer :min_dew_point_f
      t.integer :max_humidity
      t.integer :mean_humidity
      t.integer :min_humidity
      t.float   :max_sea_level_pressure_inches
      t.float   :mean_sea_level_pressure_inches
      t.float   :min_sea_level_pressure_inches
      t.integer :max_visibility_miles
      t.integer :mean_visibility_miles
      t.integer :min_visibility_miles
      t.integer :max_wind_speed_mph
      t.integer :mean_wind_speed_mph
      t.integer :max_gust_speed_mph
      t.float   :precipitation_inches
      t.integer :cloud_cover
      t.string  :events
      t.integer :wind_dir_degrees
      t.integer :zip_code

      t.timestamp null:false
    end
  end
end
