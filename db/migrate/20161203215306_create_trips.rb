class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float     :duration
      t.integer   :start_station_id
      t.integer   :end_station_id
      t.datetime  :start_date    
      t.datetime  :end_date
      t.integer   :bike_id
      t.text      :subscription_type
      t.integer   :zip_code

      t.timestamps  null:false
    end
  end
end



