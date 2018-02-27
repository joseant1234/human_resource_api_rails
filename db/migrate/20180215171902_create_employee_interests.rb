class CreateEmployeeInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_interests do |t|
      t.references :employee, foreign_key: true
      t.string :interest

      t.timestamps
    end
  end
end
