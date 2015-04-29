require 'rails_helper'

RSpec.describe ConnectionsController, type: :controller do

  let(:receiver) {create(:user)}
  let(:initializer) {create(:user)}
  let(:matching_connection) {create(:connection, receiver: receiver, initializer: initializer)}
  let(:course) {matching_connection.courses.create}
  let(:message) {matching_connection.messages.create}
  let(:unmatching_connection) {create(:connection)}


  describe 'GET #show' do 
    subject{ get :show,{id: unmatching_connection.id} }

    context 'when not signed_in' do
      it 'redirects to the login page' do
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do 
      before { sign_in receiver }

      context 'Not current_user connections' do 
        it 'redirects to user profie page' do 
          expect(subject).to redirect_to(user_path receiver)
        end
      end

      context 'current_user connections' do 
        before { get :show,{id: matching_connection.id} }

        it 'assigns correct users to @users' do 
          expect(assigns(:users)).to eq([initializer, receiver])
        end
        it 'assigns correct courses to @courses' do 
          expect(assigns(:courses)).to eq([course])
        end
        it 'assigns correct messages to @messages' do 
          expect(assigns(:messages)).to eq([message])
        end
        it 'creates a new instance of a course' do 
          expect(assigns(:course)).to be_a_new(Course)
        end
      end        
    end
  end

  describe 'DELETE #destroy' do 
    before(:each) do 
      sign_in user
      let(:matching_connection) {create(:connection, receiver: receiver, initializer: initializer)}
      subject { delete :destroy, {id: matching_connection.to_param} }
    end

    it 'destroys the requested connection' do 
      expect(subject).to change(Connection, :count).by(-1)
    end

    it 'redirects_to user profie page' do 
      expect(subject).to redirect_to(user_path user)
    end

  end



end
