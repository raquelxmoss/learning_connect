class Skill < ActiveRecord::Base
  scope :search, ->(param) { where("description ILIKE ?", "%#{param}%") }

  belongs_to :user
  scope :learning_skills, -> {where(skill_type: 'learn')}
  scope :teaching_skills, -> {where(skill_type: 'teach')}

end
