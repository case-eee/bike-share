class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date :start_date
      t.integer :start_station_id
      t.date :end_date
      t.integer :end_station_id
      t.integer :bike_id
      t.integer :subscription_type_id
      t.integer :user_zip_code

      t.timestamps null: false
    end
  end
end
