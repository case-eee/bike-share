class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.text :name

      t.timestamps null: false
    end
  end

end
