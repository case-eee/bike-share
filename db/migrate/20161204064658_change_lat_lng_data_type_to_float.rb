class ChangeLatLngDataTypeToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :stations, :lat, :float
    change_column :stations, :long, :float
  end
end
