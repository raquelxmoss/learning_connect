require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user){create(:user)}
  let(:connection){create(:connection, receiver: user)}
  let(:params){ {connection_id: connection.to_param, user_id: user.to_param, content: "message conten"} }


  describe 'POST #create' do 
    subject {post :create, params}
    context 'When not signed_in' do 
      it 'redirects to the login page' do 
        expect(subject).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do 
      before {sign_in user}
      subject {post :create, params}
      
      it 'create a new message for correct connection' do 
        expect{subject}.to change(connection.messages,:count).by(1)
      end

      it 'create a new message for correct user' do 
        expect{subject}.to change(user.messages,:count).by(1)
      end

      it 'renders the partial show without layout' do 
        expect(subject).to render_template(:partial => '_show')
      end

      it 'assigns message to the correct @message' do 
        post :create, params
        expect(assigns(:message)).to eq(Message.last)
      end

      it 'assigns connection to the correct @connection' do 
        post :create, params
        expect(assigns(:connection)).to eq(connection)
      end

    end
  end
end
