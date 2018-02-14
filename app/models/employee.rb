class Employee < ApplicationRecord
  has_many :area_interests
  has_many :certifications
  has_many :degrees
  has_many :jobs
  has_many :languages
  has_many :strengths
  has_many :employee_skills

  accepts_nested_attributes_for :area_interests,:certifications,:degrees,:jobs,:languages,:strengths, allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: nil#, path: ":rails_root/photos/:id/:style/:filename"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_presence_of :first_name, :last_name

  enum area: [:full_stack,:frontend, :php]
  enum position: [:developer, :senior_developer]

  # ---------------- CLASSESS METHOD ---------
	def self.filter_by_position(position)
		where(position: position)
	end

	def self.filter_by_area(area)
		where(area: area)
	end

	def self.filter_by_enter_on(date)
		where("employees.enter_on >= ?",date)
	end

	def self.filter_by_min_years_working(year_min)
		where("YEAR('#{Date.today}') - YEAR(enter_on) >= ?",year_min)
	end

	def self.filter_by_max_years_working(year_max)
		where("YEAR('#{Date.today}') - YEAR(enter_on) <= ?",year_max)
	end

	def self.filter_by_skills(skills)
		joins(employee_skills: :skill).where("skills.name IN (?)",skills).group("employees.id").having("count(employee_skills.id) >= ?",skills.length)
	end
end
