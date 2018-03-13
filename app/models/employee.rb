class Employee < ApplicationRecord
  belongs_to :team
  has_many :employee_languages, dependent: :destroy
  has_many :employee_projects, dependent: :destroy
  has_many :employee_skills, dependent: :destroy
  has_many :employee_soft_skills, dependent: :destroy
  has_many :employee_certifications, dependent: :destroy
  has_many :employee_interests, dependent: :destroy
  has_many :employee_project_skills, through: :employee_projects
  has_many :employee_project_responsabilities, through: :employee_projects

  accepts_nested_attributes_for :employee_languages,
      :employee_projects,
      :employee_skills,
      :employee_soft_skills,
      :employee_certifications,
      :employee_interests,
      allow_destroy: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: nil#, path: ":rails_root/photos/:id/:style/:filename"
  has_attached_file :resume

  validates_attachment_content_type :resume, :content_type => ["application/pdf"]
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_presence_of :first_name, :last_name

  # ---------------- CLASSESS METHOD ---------
  def self.filter_by_position(position)
    where(position: position)
  end

  def self.filter_by_team(team_id)
    where(team_id: team_id)
  end

  def self.filter_by_start_on(date)
    where("employees.created_at >= ?",date)
  end

  def self.filter_by_min_years_working(year_min)
    where("YEAR('#{Date.today}') - YEAR(employees.created_at) >= ?",year_min)
  end

  def self.filter_by_max_years_working(year_max)
    where("YEAR('#{Date.today}') - YEAR(employees.created_at) <= ?",year_max)
  end

  def self.filter_by_skills(skills)
    joins(employee_skills: :skill).where("skills.name IN (?)",skills).group("employees.id").having("count(employee_skills.id) >= ?",skills.length)
  end

  # ---------------- INSTANCE METHOD ---------
  def display_full_name
    "#{self.first_name} #{self.last_name}"
  end


end
