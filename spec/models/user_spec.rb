require 'rails_helper'

RSpec.describe User, type: :model do

  it {should have_many :tutor_connections}
  it {should have_many :learner_connections}
  it {should have_many :tutors}
  it {should have_many :learners}


end
