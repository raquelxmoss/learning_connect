require 'rails_helper'

RSpec.describe SkillsController, type: :controller do

  let!(:user) {create(:user)}
  let!(:matching_skill) {user.skills.create}
  let!(:unmatching_skills) {create(:skill_teach)}

  context 'When not signed in' do 

    describe 'GET#index' do 
      subject { get :index, {user_id: user.id  } }
      it 'redirects to login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST#create' do 
      subject { post :create, {user_id: user.id, description: 'learn Spanish'  } }
      it 'redirects to login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE#destroy' do 
      subject { delete :destroy, {user_id: user.id, id: matching_skill.id} }
      it 'redirects to login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'When signed in' do 
    describe 'GET#index' do 
      before do 
        sign_in user
        get :index, {user_id: user.id  } 
      end

      it 'assigns the correct skills to @skills' do 
        expect(assigns(:skills)).to eq([matching_skill])
      end
      it 'respond_to html format '
      it 'respond_to js format '
    end

    describe 'POST#create' do 
    end

    describe 'DELETE#destroy' do 
    end
  end



end
