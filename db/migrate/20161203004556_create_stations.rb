class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table  :stations do |t|
      t.string    :name
      t.integer   :dock_count
      t.integer   :city_id
      t.datetime  :installation_date
      t.timestamps null: false
    end
  end
end
