class EmployeeProject < ApplicationRecord
  belongs_to :employee
  has_many :employee_project_responsabilities, dependent: :destroy
  has_many :employee_project_skills, dependent: :destroy

  accepts_nested_attributes_for :employee_project_responsabilities,:employee_project_skills,allow_destroy: true
end
