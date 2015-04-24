class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :initializer_connections, class_name: 'Connection', foreign_key: 'receiver_id'
  has_many :initializers, class_name: 'User', through: :initializer_connections

  has_many :receiver_connections, class_name: 'Connection', foreign_key: 'initializer_id'
  has_many :receivers, class_name: 'User', through: :receiver_connections

  has_many :courses, through: :connections


end
