require 'rails_helper'

RSpec.describe Connection, type: :model do


  it {should belong_to :tutor}
  it {should belong_to :learner}
  it {should have_many :messages}



  describe 'Agreement reached' do 
  
    it {should have_one :agreement}

  end

  describe 'Agreement not reached' do 
  
  end



end
