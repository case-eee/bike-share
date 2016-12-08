class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.text    :name
      t.float  :lat
      t.float  :long
      t.integer :dock_count
      t.date    :installation_date
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
