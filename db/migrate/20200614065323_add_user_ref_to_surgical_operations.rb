class AddUserRefToSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    add_reference :surgical_operations, :user, foreign_key: true
  end
end
