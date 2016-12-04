class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float   :duration
      t.text      :start_station 
      t.float   :start_station_id
      t.text      :end_station
      t.float   :end_station_id
      t.datetime  :start_date    
      t.datetime  :end_date
      t.float   :bike_id
      t.text      :subscription_type
      t.float   :zip_code

      t.timestamps  null:false
    end
  end
end



