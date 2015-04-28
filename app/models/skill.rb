class Skill < ActiveRecord::Base
  scope :search, ->(param) { where("description ILIKE ?", "%#{param}%") }

  belongs_to :user
  scope :learning_skills, -> {where(skill_type: 'learn')}
  scope :teaching_skills, -> {where(skill_type: 'teach')}

  after_save :skill_change_notification
  before_create :skill_change_notification


  def self.search(search)
  	where("description ILIKE ?","%#{search}%")
  end

  private

  def skill_change_notification
  	SkillMailer.skill_add(self).deliver
  end
end
