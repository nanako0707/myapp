class CreateReads < ActiveRecord::Migration[5.2]
  def change
    create_table :reads do |t|
      t.integer :user_id
      t.integer :surgical_operation_id

      t.timestamps
    end
  end
end
