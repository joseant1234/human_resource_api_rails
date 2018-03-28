class EmployeeProjectSkill < ApplicationRecord
  belongs_to :employee_project
  belongs_to :skill

  after_create :set_employee_skill

  private
  def set_employee_skill
    employee_id = self.employee_project.employee_id
    unless EmployeeSkill.where(skill_id: self.skill_id, employee_id:employee_id ).any?
      EmployeeSkill.create(skill_id: self.skill_id,employee_id: employee_id)
    end
  end
end
