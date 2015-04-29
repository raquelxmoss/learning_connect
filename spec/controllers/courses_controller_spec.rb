require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:receiver) {create(:user)}
  let(:initializer) {create(:user)}
  let(:connection) {create(:connection, receiver: receiver, initializer: initializer)}
  let(:unmatching_connection) {create(:connection)}
  let(:matching_course) {connection.courses.create}
  let(:unmatching_course) {unmatching_connection.courses.create}
  let(:params) { {connection_id: connection.to_param, course: {title: 'title', status: 'status' } } }
  let(:params_learning_objectives) { {connection_id: connection.to_param, course: {title: 'title', status: 'status' } , learningObjectives: ['test0','test1','test2','test3']}}
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

  describe 'POST' do 
    before do 
      sign_in receiver 
    end

    describe '#create' do 

      it "creates a new Connection" do
        expect {
          post :create, params
        }.to change(Course, :count).by(1)
      end

      it 'assigns a newly created course as @course' do 
        post :create, params
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it 'the course has the corresponding connection_id' do
        post :create, params
        expect(Course.last.connection).to eq(connection)
      end

      it 'redirects to the connection page' do 
        post :create, params
        expect(response).to redirect_to(connection_path connection) 
      end

      context 'with learning objectives' do 

        it 'creates the corresponding number of learning_objectives' do
          expect{
            post :create, params_learning_objectives
          }.to change(LearningObjective,:count).by(4)
        end

        it 'creates lesarning_objectives that belongs to the corresponding course' do 
          post :create, params_learning_objectives
          expect(Course.last.learning_objectives).to eq(LearningObjective.last(4))
        end


      end




    end

    describe '#update' do 

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
