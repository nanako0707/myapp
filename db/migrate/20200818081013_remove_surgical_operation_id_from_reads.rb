class RemoveSurgicalOperationIdFromReads < ActiveRecord::Migration[5.2]
  def up
    remove_column :reads, :surgical_operation_id
  end

  def down
    add_column :reads, :surgical_operation_id, :bigint
  end
end
