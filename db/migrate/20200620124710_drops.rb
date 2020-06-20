class Drops < ActiveRecord::Migration[5.2]
  def change
    drop_table :reads
  end
end
