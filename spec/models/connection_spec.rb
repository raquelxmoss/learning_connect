require 'rails_helper'

RSpec.describe Connection, type: :model do


  it {should belong_to :initializer}
  it {should belong_to :receiver}
  it {should have_many :messages}

  describe 'Aggrement reached' do 

    it {should have_many :courses}

  end


  describe 'Aggrement not reached' do 


  end
end
