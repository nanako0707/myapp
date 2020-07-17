class RemoveReadingIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :reading_id, :integer
  end
end
