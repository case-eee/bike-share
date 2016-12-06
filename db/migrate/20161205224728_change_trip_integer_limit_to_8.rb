class ChangeTripIntegerLimitTo8 < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :duration, :integer, limit: 8
    change_column :trips, :start_station_id, :integer, limit: 8
    change_column :trips, :end_station_id, :integer, limit: 8
    change_column :trips, :bike_id, :integer, limit: 8
    change_column :trips, :subscription_type_id, :integer, limit: 8
    change_column :trips, :user_zip_code, :integer, limit: 8
  end
end
