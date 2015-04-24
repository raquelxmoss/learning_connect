require 'rails_helper'

RSpec.describe Course, type: :model do

  it {should have_many :learning_objectives}
  it {should have_many :ratings}
  it {should belong_to :connection}
  it {should have_one :tutor}
  it {should have_one :learner}


end
