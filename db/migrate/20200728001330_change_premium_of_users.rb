class ChangePremiumOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :premium, :boolean, default: false
  end

  def down
    change_column :users, :premium, :boolean
  end
end
