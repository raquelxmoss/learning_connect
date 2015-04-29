require 'rails_helper'

RSpec.describe ConnectionsController, type: :controller do 
  let(:receiver) {create(:user)}
  let(:initializer) {create(:user)}
  let(:matching_connection) {create(:connection, receiver: receiver, initializer: initializer)}
  let(:course) {matching_connection.courses.create}
  let(:message) {matching_connection.messages.create(content: 'test')}
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

  describe 'POST #create' do 
    before do 
      sign_in receiver 

    end

    it "creates a new Connection" do
      expect {
        post :create, {receiver_id: receiver.id}
      }.to change(Connection, :count).by(1)
    end

    it 'assigns a newly created connection as @connection' do
      post :create, {receiver_id: receiver.id }
      expect(assigns(:connection)).to be_a(Connection)
      expect(assigns(:connection)).to be_persisted
    end

    it 'redirects to the created connection' do 
      post :create, {receiver_id: receiver.id }
      expect(response).to redirect_to(Connection.last) 
    end
  end



  describe 'DELETE #destroy' do 
    
    subject {delete :destroy, {id: matching_connection.to_param}}    

    before {sign_in receiver}

    it 'destroys the requested connection' do 
      connection = Connection.create!(receiver: receiver, initializer: initializer)
      expect{
        delete :destroy, {id: connection.to_param}
        }.to change(Connection, :count).by(-1)
    end

    it 'redirects_to user profie page' do 
      expect(subject).to redirect_to(user_path receiver)
    end

  end



end
