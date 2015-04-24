class Course < ActiveRecord::Base
  has_many :learning_objectives
  has_many :ratings

  belongs_to :connection
  belongs_to :tutor, class_name: 'User'
  belongs_to :learner,class_name: 'User'

end
