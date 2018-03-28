class EmployeeCertification < ApplicationRecord
  belongs_to :employee

  validates_presence_of :certification
end
