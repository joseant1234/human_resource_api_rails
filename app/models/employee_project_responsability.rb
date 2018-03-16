class EmployeeProjectResponsability < ApplicationRecord
  belongs_to :employee_project

  validates_presence_of :responsability
end
