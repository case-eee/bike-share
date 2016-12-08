class AddIndexToTripsForStartDate < ActiveRecord::Migration[5.0]
  def change
    add_index :trips, :start_date
  end
end
