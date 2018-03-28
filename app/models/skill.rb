class Skill < ApplicationRecord
  has_many :employees
  has_many :employee_project_skills


  def self.filter_by_names(skill_names)
    where("name IN (?)", skill_names)
  end

end
