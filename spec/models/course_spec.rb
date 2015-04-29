require 'rails_helper'

RSpec.describe Course, type: :model do


  it {should have_many :learning_objectives}
  it {should have_many :ratings}
  it {should belong_to :connection}
  it {should belong_to :tutor}
  it {should belong_to :learner}

  it {should validate_presence_of :connection_id}

end
