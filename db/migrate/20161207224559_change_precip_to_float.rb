class ChangePrecipToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :precipitation_inches, :float
  end
end
