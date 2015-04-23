class Agreement < ActiveRecord::Base

  belongs_to :course
  belongs_to :connection

end
