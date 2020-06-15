class AddImageToSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :surgical_operations, :image, :string
  end
end
