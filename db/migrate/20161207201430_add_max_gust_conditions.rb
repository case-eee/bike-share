class AddMaxGustConditions < ActiveRecord::Migration[5.0]
  def change
    add_column :conditions, :max_gust_speed_mph, :integer
  end
end
