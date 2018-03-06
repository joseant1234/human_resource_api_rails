class Link < ApplicationRecord
  belongs_to :user
  has_many :link_skills, dependent: :destroy
  has_many :skills, through: :link_skills

  validates :link_skills, presence: true
  before_create :set_defaults

  def build_from_params(skill_names)
    skills = Skill.filter_by_names(skill_names)
    skills.each do |skill|
      self.link_skills.new({skill: skill})
    end
    self
  end

  private
  def set_defaults
  	self.url = Digest::MD5.hexdigest("#{DateTime.now}#{self.id}")
    self.expiration_date =  DateTime.now + 4.days
  end
end
