class EmployeeLanguage < ApplicationRecord
  belongs_to :employee

  validates_presence_of :language
end
