class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :connections, foreign_key: 'receiver_id'
  has_many :connections, foreign_key: 'initializer_id'
  has_many :acquaintances, class_name: 'User', through: :connections, source: :initializer
  has_many :acquaintances, class_name: 'User', through: :connections, source: :receiver

  has_many :classes, class_name: 'Course', through: :connections, foreign_key: 'tutor_id'
  has_many :lessons, class_name: 'Course', through: :connections, foreign_key: 'learner_id'

  has_many :tutors, class_name: 'User', through: :courses, foreign_key: 'learner_id'
  has_many :learners, class_name: 'User', through: :courses, foreign_key: 'tutor_id'

  has_many :messages

  has_many :courses, through: :connections

  has_many :skills

end
