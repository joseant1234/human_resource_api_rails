class CreateEmployeeProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_projects do |t|
      t.references :employee, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :title
      t.string :role

      t.timestamps
    end
  end
end
