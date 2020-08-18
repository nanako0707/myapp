class RemoveUserIdFromReads < ActiveRecord::Migration[5.2]
  def up
    remove_column :reads, :user_id, :bigint
  end

  def down
    add_column :reads, :user_id, :bigint
  end
end
