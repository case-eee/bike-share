class CreateIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :trips, :start_station_id
    add_index :trips, :end_station_id
    add_index :trips, :bike_id
    add_index :trips, :zipcode_id
    add_index :trips, :subscription_id

    add_index :stations, :name
    add_index :stations, :city_id

    add_index :zipcodes, :zipcode

    add_index :cities, :name
  end
end
