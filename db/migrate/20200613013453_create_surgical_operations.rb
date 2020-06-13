class CreateSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :surgical_operations do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
