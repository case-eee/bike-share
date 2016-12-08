class CreateSubscribersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :subscription_type
      t.timestamps null: false
    end
  end
end
