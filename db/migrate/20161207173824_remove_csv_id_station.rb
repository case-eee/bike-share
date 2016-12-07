class RemoveCsvIdStation < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :csv_id
  end
end
