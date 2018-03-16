class EmployeeInterest < ApplicationRecord
  belongs_to :employee

  validates_presence_of :interest
end
