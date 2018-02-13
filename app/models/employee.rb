class Employee < ApplicationRecord

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: nil#, path: ":rails_root/photos/:id/:style/:filename"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :first_name, :last_name

  enum area: [:full_stack,:frontend, :php]
  enum position: [:developer, :senior_developer]
end
