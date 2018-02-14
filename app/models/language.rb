class Language < ApplicationRecord
  belongs_to :employee, optional: true
end
