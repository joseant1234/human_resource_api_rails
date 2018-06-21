class CreateEmployeeProjectResponsabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_project_responsabilities do |t|
      t.references :employee_project, foreign_key: true
      t.string :responsability

      t.timestamps
    end
  end
end
