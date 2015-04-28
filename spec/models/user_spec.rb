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

  describe 'SCOPE #search' do 

    let(:matching_user){create(:alex)}
    let(:unmatching_user){create(:john)}

    context 'matching results' do 
      before{ @users =  User.search('al') }

      it 'returns the users with matching skills' do 
        expect(@users).to include(matching_user)
      end

      it 'does not return users with unmatching skills' do 
        expect(@users).not_to include(unmatching_user)
      end
    end

    context 'unmatching results' do 
      before{ @users =  User.search('xzz') }

      it 'returns an empty array' do 
        expect(@users).to eq([])
      end
    end

    context 'no argument passed in' do 
      before{ @users =  User.search(nil) }

      it 'returns all the Users' do
        expect(@users.count).to eq(User.count)
      end
    end

  end

end
