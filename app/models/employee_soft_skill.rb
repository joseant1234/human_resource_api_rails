class EmployeeSoftSkill < ApplicationRecord
  belongs_to :employee

  validates_presence_of :soft_skill
end
