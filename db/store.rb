class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :dock_count
      t.string :city
      t.string :installation_date
      t.timestamps null: false
    end
  end
end

class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.string :start_date
      t.string :start_station_name
      t.integer :start_station_id
      t.string :end_date
      t.string :end_station_name
      t.integer :end_station_id
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
