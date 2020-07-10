class RemoveCompleteFromReadings < ActiveRecord::Migration[5.2]
  def up
    remove_column :readings, :complete
  end

  def down
    add_column :readings, :complete, :boolean
  end
end
