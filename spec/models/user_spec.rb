require 'rails_helper'

RSpec.describe User, type: :model do

  it {should have_many :connections}
  it {should have_many :acquaintances}
  it {should have_many :classes}
  it {should have_many :lessons}
  it {should have_many :tutors}
  it {should have_many :learners}
  it {should have_many :messages}
  it {should have_many :skills}

end
