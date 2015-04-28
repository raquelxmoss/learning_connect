require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # before(:each) do 
  #   @user = create(:user)
  #   sign_in @user 
  # end
  describe 'GET' do

    before do 
      @user = create(:user)
    end

    context "#index" do
      it "assigns all users as @users" do
        get :index, {}
        expect(assigns(:users)).to eq([@user])
      end
    end

    let!(:connection) { @user.receiver_connections.create }
    let!(:skill){ @user.skills.create }
    let!(:unmatching_connection) {create(:connection)}
    let!(:unmatching_skill) {create(:skill_spanish)}

    context "#show" do 
      context "when not signed_in" do
        before(:each) { get :show, {:id => @user.to_param} } 

        it "assigns the requested user as @user" do
          expect(assigns(:user)).to eq(@user)
        end

        it 'returns nil as @connections'do 
          expect(assigns(:connections)).to eq(nil)
        end

        it 'assigns the corresponding skills as @skills' do 
          expect(assigns(:skills)).to eq([skill])
        end
      end

      context 'When signed_in' do 

        it 'assigns the corresponding connections as @connections'do 
          sign_in @user 
          get :show, {:id => @user.to_param}
          expect(assigns(:connections)).to eq([connection])
        end

      end
    end






  end

end
