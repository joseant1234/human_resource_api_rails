class AddReferencesToEmployeeSkills < ActiveRecord::Migration[5.1]
  def change
    add_reference :employee_skills, :skill, foreign_key: true
    remove_column :employee_skills, :skill
  end
end
