require 'rails_helper'

RSpec.describe SkillsController, type: :controller do

  let!(:user) {create(:user)}
  let!(:spanish_skill) {create(:skill_spanish)}
  let!(:english_skill) {create(:skill_english)}

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
      subject { delete :destroy, {user_id: user.id, id: spanish_skill.id} }
      it 'redirects to login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'When signed in' do 
    describe 'POST#index' do 
      before do 
        sign_in user
        subject { post :index, {search: 'spanish'} }
      end

      it 'assigns the correct skills @skills' do
        expect(assigns(:skills)).to eq([spanish_skill])
      end
    end

    describe 'POST#create' do 
    end

    describe 'DELETE#destroy' do 
    end
  end



end
