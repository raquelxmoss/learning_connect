class Course < ActiveRecord::Base
  has_many: learning_objectives
  has_many: ratings
end
