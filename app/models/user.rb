class User < ActiveRecord::Base

  scope :search, ->(param) { where("name ILIKE ?", "%#{param}%") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :initializer_connections, class_name: 'Connection', foreign_key: 'receiver_id'
  has_many :initializers, class_name: 'User', through: :initializer_connections

  has_many :receiver_connections, class_name: 'Connection', foreign_key: 'initializer_id'
  has_many :receivers, class_name: 'User', through: :receiver_connections

  has_many :classes, class_name: 'Course', through: :connections, foreign_key: 'tutor_id'
  has_many :lessons, class_name: 'Course', through: :connections, foreign_key: 'learner_id'

  has_many :tutors, class_name: 'User', through: :courses, foreign_key: 'learner_id'
  has_many :learners, class_name: 'User', through: :courses, foreign_key: 'tutor_id'

  has_many :messages

  has_many :courses, through: :connections

  has_many :skills

end
