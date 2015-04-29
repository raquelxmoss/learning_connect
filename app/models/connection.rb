class Connection < ActiveRecord::Base

  belongs_to :initializer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  
  has_many :messages
  has_many :courses
  
  #  THERE FOR TWEETS PROJECT, NOT SURE IF WE NEED A SINGLE CONNECTION PER USER
  validates_uniqueness_of :initializer_id, scope: :receiver_id
  validates_uniqueness_of :receiver_id, scope: :initializer_id

  def belongs_to? user
    (self.initializer == user) || (self.receiver == user)
  end


end
