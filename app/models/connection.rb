class Connection < ActiveRecord::Base

  belongs_to :tutor, class_name: 'User'
  belongs_to :learner, class_name: 'User'
  has_many :messages
  
  #  THERE FOR TWEETS PROJECT, NOT SURE IF WE NEED A SINGLE CONNECTION PER USER
  # validates_uniqueness_of :tutor_id, scope: :learner_id
  # validates_uniqueness_of :learner_id, scope: :tutor_id

end
