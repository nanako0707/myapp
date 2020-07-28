class ChangePremiumToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :premium, :boolean, default: false, null: false
  end

  def down
    change_column :users, :premium, :boolean, default: false
  end
end
