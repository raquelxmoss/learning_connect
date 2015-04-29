require 'rails_helper'

RSpec.describe Connection, type: :model do


  it {should belong_to :initializer}
  it {should belong_to :receiver}
  it {should have_many :messages}
  it {should validate_uniqueness_of :initializer_id}
  it {should validate_uniqueness_of :receiver_id}

  let(:user) {create(:user)}
  let(:matching_connection) {create(:connection, receiver: user)}
  let(:unmatching_connection) {create(:connection)}

  describe 'belongs_to?' do 
    it 'returns true if user belongs to connection' do 
      expect(matching_connection.belongs_to? user).to eq(true)
    end

    it 'returns false if user do not belong to connection' do 
      expect(unmatching_connection.belongs_to? user).to eq(false)
    end
  end

  describe 'Aggrement reached' do 

    it {should have_many :courses}

  end


  describe 'Aggrement not reached' do 


  end
end
