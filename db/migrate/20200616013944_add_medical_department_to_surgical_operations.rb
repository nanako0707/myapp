class AddMedicalDepartmentToSurgicalOperations < ActiveRecord::Migration[5.2]
  def change
    add_column :surgical_operations, :medical_department, :string
  end
end
