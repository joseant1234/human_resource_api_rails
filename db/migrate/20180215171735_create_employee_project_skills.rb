class CreateEmployeeProjectSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_project_skills do |t|
      t.references :employee_project, foreign_key: true
      t.string :skill

      t.timestamps
    end
  end
end
