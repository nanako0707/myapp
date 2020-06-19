class AddCompleteToReads < ActiveRecord::Migration[5.2]
  def change
    add_column :reads, :complete, :boolean, default: false
  end
end
