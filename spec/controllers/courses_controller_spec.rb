require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:receiver) {create(:user)}
  let(:initializer) {create(:user)}
  let(:connection) {create(:connection, receiver: receiver, initializer: initializer)}
  let(:unmatching_connection) {create(:connection)}
  let(:matching_course) {connection.courses.create}
  let(:unmatching_course) {unmatching_connection.courses.create}

  describe 'GET' do 

    describe '#show' do 
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

    describe '#edit' do 
      subject {get :edit, {connection_id: unmatching_connection.to_param, id: unmatching_course.to_param}}

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
          before {get :edit, {connection_id: connection.to_param, id: matching_course.to_param}}

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


  

  describe 'DELETE #destroy' do 
      
    subject {delete :destroy, {connection_id: connection.to_param, id: matching_course.to_param}}    

    before {sign_in receiver}

    it 'destroys the requested connection' do 
      course = connection.courses.create!
      expect{
        delete :destroy, {connection_id: connection.to_param, id: course.to_param}
        }.to change(Course, :count).by(-1)
    end

    it 'redirects_to user profie page' do 
      expect(subject).to redirect_to(connection)
    end

  end
end
