class Rating < ActiveRecord::Base
  belongs_to :course
  validates_inclusion_of :rating, :in => 1..5
end
