class ChangeDataSurgicalOperationIdToReads < ActiveRecord::Migration[5.2]
  def change
    change_column :reads, :surgical_operation_id, :bigint
  end
end
