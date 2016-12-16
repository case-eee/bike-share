class ChangeRangeLimitInTripsIntegers < ActiveRecord::Migration[5.0]
  def change
   change_column :trips, :duration, :integer, limit: 8
   change_column :trips, :start_station_id, :integer, limit: 8
   change_column :trips, :end_station_id, :integer, limit: 8
   change_column :trips, :bike_id, :integer, limit: 8
   change_column :trips, :subscription_id, :integer, limit: 8
   change_column :trips, :zipcode, :integer, limit: 8
  end
end
