class User < ApplicationRecord
  has_secure_password
  has_many :links

  validates :email, :presence => true, :email => true, :uniqueness => {case_sensitive: false}
end
