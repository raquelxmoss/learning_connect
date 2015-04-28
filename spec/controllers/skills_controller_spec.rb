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

end
