require 'rails_helper'

RSpec.describe Connection, type: :model do


  it {should belong_to :tutor}
  it {should belong_to :learner}
  it {should have_many :messages}


end
