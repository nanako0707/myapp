class ChangeNotnullToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :surgical_operation_id, :bigint, null: false
    change_column :comments, :user_id, :bigint, null: false
    change_column :comments, :content, :text, null: false
  end
end
