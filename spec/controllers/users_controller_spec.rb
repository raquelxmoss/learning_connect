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

    context "#show" do
      it "assigns the requested user as @user" do
        get :show, {:id => @user.to_param}
        expect(assigns(:user)).to eq(@user)
      end

      it 'assigns the corresponding connections as @connections'
      
    end

    after(:each) { User.delete_all }

  end

end
