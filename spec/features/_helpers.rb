module RspecFeatureHelpers
  def sign_in_as user
    visit '/'
    click_link 'Log in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  def sign_out
    click_link 'Log out'
  end
end
