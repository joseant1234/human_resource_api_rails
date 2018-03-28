class AddReferencesToEmployeeProjectSkills < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_project_skills, :skill, foreign_key: true
    remove_column :employee_project_skills, :skill
  end
end
