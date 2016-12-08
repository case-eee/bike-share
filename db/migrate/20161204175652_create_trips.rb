class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float :duration
      t.datetime :start_date
      t.string :start_station_name
      t.float :start_station_id
      t.datetime :end_date
      t.string :end_station_name
      t.float :end_station_id
      t.float :bike_id
      t.string :subscription_type
      t.float :zip_code

      t.timestamps null: false
    end
  end
end
