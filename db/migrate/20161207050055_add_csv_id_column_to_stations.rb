class AddCsvIdColumnToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :csv_id, :integer
  end
end
