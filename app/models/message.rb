class Message < ActiveRecord::Base
  belongs_to :connection
  belongs_to :user
  default_scope {order('created_at desc')}
  # validates_presence_of :content
end
