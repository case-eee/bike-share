class ChangesTimeFormatOnSubscriptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :start_date
    add_column :trips, :start_date, :date
  end
end
