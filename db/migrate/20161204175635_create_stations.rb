class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations, id: false do |t|
      t.primary_key :id
      t.string :name
      t.float :lat
      t.float :long
      t.integer :dock_count
      t.string :city
      t.datetime :installation_date
      t.timestamps null: false
    end
  end
end
