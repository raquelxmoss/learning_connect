class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :learner_connections, class_name: 'Connection', foreign_key: 'tutor_id'
  has_many :learners, class_name: 'User', through: :learner_connections

  has_many :tutor_connections, class_name: 'Connection', foreign_key: 'learner_id'
  has_many :tutors, class_name: 'User', through: :tutor_connections

  has_many :courses, through: :connections

  has_many :skills


end
