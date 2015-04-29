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

    end
  end

  describe 'DELETE #destroy' do 
    subject {delete :destroy, {connection_id: connection.to_param, id: @message.to_param}}    

    before(:each) do 
      sign_in user
      @message = connection.messages.create(user_id: user.to_param, content: "message content")
    end

    it 'decreases by 1 the number of messages' do 
      expect{subject}.to change(Message, :count).by(-1)
    end
    it 'decreases by 1 the number of user messages' do 
      expect{subject}.to change(user.messages, :count).by(-1)
    end
    it 'ddecreases by 1 the number of connection messages' do 
      expect{subject}.to change(connection.messages, :count).by(-1)
    end
  end
end
