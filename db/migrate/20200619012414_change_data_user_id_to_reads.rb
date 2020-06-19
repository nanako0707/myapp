class ChangeDataUserIdToReads < ActiveRecord::Migration[5.2]
  def change
    change_column :reads, :user_id, :bigint
  end
end
