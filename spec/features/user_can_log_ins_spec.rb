require 'rails_helper'

feature "User Can Log In" do
  background do
    @user = FactoryGirl.create(:user, password: 'password')
    visit '/'
    click_link 'Login'
    fill_in 'user_email', with: @user.email
  end

  scenario "with correct data" do
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page.text).to match(/Signed in successfully/)
  end

  scenario "with invalid credentials" do
    fill_in 'user_password', with: 'spaghetti'
    click_button 'Log in'
    expect(page.text).to match(/Invalid email or password/)
  end
end
