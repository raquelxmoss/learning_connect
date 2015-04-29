require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:receiver) {create(:user)}
  let(:initializer) {create(:user)}
  let(:connection) {create(:connection, receiver: receiver, initializer: initializer)}
  let(:unmatching_connection) {create(:connection)}
  let(:matching_course) {connection.courses.create}
  let(:unmatching_course) {unmatching_connection.courses.create}

  describe 'GET #show' do 
    subject {get :show, {connection_id: unmatching_connection.to_param, id: unmatching_course.to_param}}

    context 'When not signed_in' do 
      it 'redirects to the login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end 

    context 'when signed in' do 
      before {sign_in receiver}
      context 'but not corresponding course' do
        it 'redirects to user profile page' do 
          expect(subject).to redirect_to(user_path receiver)
        end
      end

      context 'with corresponding course' do 
        before {get :show, {connection_id: connection.to_param, id: matching_course.to_param}}

        it 'assigns the correct connection' do 
          expect(assigns(:connection)).to eq(connection)
        end

        it 'assigns the correct course' do 
          expect(assigns(:course)).to eq(matching_course)
        end
      end
    end
  end





end
