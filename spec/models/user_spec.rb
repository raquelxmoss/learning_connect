require 'rails_helper'

RSpec.describe User, type: :model do

  it {should have_many :receiver_connections}
  it {should have_many :initializer_connections}
  it {should have_many :initializers}
  it {should have_many :receivers}

  it {should have_many :classes}
  it {should have_many :lessons}

  it {should have_many :tutors}
  it {should have_many :learners}
  
  it {should have_many :messages}
  it {should have_many :skills}

end
