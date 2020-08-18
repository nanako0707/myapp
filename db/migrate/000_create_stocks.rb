class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :surgical_operation, foreign_key: true, null: false

      t.timestamps
      t.index [:user_id, :surgical_operation_id], unique: true
    end
  end
end
