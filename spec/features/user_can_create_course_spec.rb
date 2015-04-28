require 'rails_helper'

feature "Create course", js: true do

  background do
      @tutor = create(:user)
      @learner = create(:user)
      sign_in_as @tutor
      visit user_path(@learner)
      click_on 'Connect'
      visit user_path(@tutor)
    end

    background do
      @user = FactoryGirl.create(:user, password: 'password')
      visit '/'
      click_link 'Login'
      fill_in 'user_email', with: @user.email
    end

  scenario "visit connection page" do
    visit user_path(@tutor)
    click_on("#{@learner.name}")
    expect(current_path).to eq(connection_path(@connection))
  end

end