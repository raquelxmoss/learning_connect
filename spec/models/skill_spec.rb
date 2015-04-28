require 'rails_helper'

RSpec.describe Skill, type: :model do

  it {should belong_to :user}



  describe 'SCOPE #search' do 
    let(:spanish){create(:skill_spanish)}
    let(:english){create(:skill_english)}

    context 'matching results' do 
      before{ @skills =  Skill.search('sp') }

      it 'returns the skills with matching name' do 
        expect(@skills).to include(spanish)
      end

      it 'does not return skills with unmatching name' do 
        expect(@skills).not_to include(english)
      end
    end

    context 'unmatching result names' do 
      before{ @skills =  Skill.search('xzz') }

      it 'returns an empty array' do 
        expect(@skills).to eq([])
      end
    end

    context 'no argument passed in' do 
      before{ @skills =  Skill.search(nil) }

      it 'returns all the skills' do
        expect(@skills.count).to eq(Skill.count)
      end
    end

  end

  describe 'SCOPE #teaching_skills' do 
    let(:teach){create(:skill_teach)}
    let(:learn){create(:skill_learn)}




  end

end
