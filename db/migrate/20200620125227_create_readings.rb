class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :surgical_operation, foreign_key: true, null: false
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
