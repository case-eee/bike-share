class UpdateTypeSubscriber < ActiveRecord::Migration[5.0]
  def change 
    add_column :subscriptions, :name, :string
  end
end
