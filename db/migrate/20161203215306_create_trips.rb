class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.bigint    :duration
      t.integer    :start_station_id
      t.integer    :end_station_id
      t.datetime  :start_date_time
      t.date      :start_date
      t.datetime  :end_date_time
      t.date      :end_date
      t.bigint    :bike_id
      t.text      :subscription_type
      t.bigint    :zip_code

      t.timestamps  null:false
    end
  end
end
