class AddLatLngToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :lat, :integer
    add_column :stations, :long, :integer
  end
end
