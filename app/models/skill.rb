class Skill < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
  	where("description ILIKE ?","%#{search}%")
  end
end
