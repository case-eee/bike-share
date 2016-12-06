class CreateStationTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :station_trips do |t|
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
