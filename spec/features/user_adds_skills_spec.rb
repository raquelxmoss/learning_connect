require 'rails_helper'

feature "User can add skill", js: true do
  background do
    @user = create(:user)
    sign_in_as @user
  end

  scenario "add skill to teach" do
    visit user_path(@user)
    within "#teach" do
      fill_in 'skill_description', with: 'banana throwing'
      click_button 'new skill'
    end
    expect(page.text).to match(/banana throwing/)
  end
end
