class Skill < ActiveRecord::Base
  scope :search, ->(param) { where("description ILIKE ?", "%#{param}%") }

  belongs_to :user
  scope :learning_skills, -> {where(skill_type: 'learn')}
  scope :teaching_skills, -> {where(skill_type: 'teach')}

  after_save :skill_change_notification
  before_destroy :skill_change_notification


  private

  def skill_change_notification
  	SkillMailer.skill_add(self).deliver_now
  end
  
end
