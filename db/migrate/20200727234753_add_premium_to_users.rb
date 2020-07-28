class AddPremiumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :premium, :boolean
  end
end
