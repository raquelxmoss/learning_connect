class Skill < ActiveRecord::Base
  belongs_to :user
  scope :learning_skills, -> {where(skill_type: 'learn')}
  scope :teaching_skills, -> {where(skill_type: 'teach')}



  def self.search(search)
  	where("description ILIKE ?","%#{search}%")
  end
end
