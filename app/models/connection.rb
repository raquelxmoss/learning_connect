class Connection < ActiveRecord::Base

  belongs_to :initializer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages
  has_many :courses
  
  #  THERE FOR TWEETS PROJECT, NOT SURE IF WE NEED A SINGLE CONNECTION PER USER
  # validates_uniqueness_of :tutor_id, scope: :learner_id
  # validates_uniqueness_of :learner_id, scope: :tutor_id

end
