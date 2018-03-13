class EmployeeProject < ApplicationRecord
  belongs_to :employee
  has_many :employee_project_responsabilities, dependent: :destroy
  has_many :employee_project_skills, dependent: :destroy

  accepts_nested_attributes_for :employee_project_responsabilities,:employee_project_skills,allow_destroy: true

  # ---------------- INSTANCE METHOD ---------
  def since_to
    "#{self.start_date.try(:strftime,'%b %Y')} - #{self.end_date.try(:strftime,'%b %Y') || 'Present'}"
  end
end
