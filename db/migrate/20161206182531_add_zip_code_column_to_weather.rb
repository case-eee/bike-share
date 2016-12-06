class AddZipCodeColumnToWeather < ActiveRecord::Migration[5.0]
  def change
    add_column :weather_conditions, :zip_code, :integer
  end
end
