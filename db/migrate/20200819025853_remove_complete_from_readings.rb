class RemoveCompleteFromReadings < ActiveRecord::Migration[5.2]
  def change
    remove_column :readings, :complete, :boolean
  end
end
