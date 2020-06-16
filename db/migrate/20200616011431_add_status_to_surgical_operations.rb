class AddStatusToSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :surgical_operations, :status, :string
  end
end
