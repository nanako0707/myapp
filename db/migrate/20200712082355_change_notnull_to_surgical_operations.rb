class ChangeNotnullToSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    change_column :surgical_operations, :title, :string, null: false
    change_column :surgical_operations, :content, :text, null: false
    change_column :surgical_operations, :user_id, :bigint, null: false
    change_column :surgical_operations, :medical_department, :string, null: false
  end
end
