require 'rails_helper'

feature "Send Message", js: true do

  background do
      @tutor = create(:user)
      @learner = create(:user)
      @connection = Connection.create(initializer_id:@tutor.id, receiver_id: @learner.id)
      sign_in_as @tutor
      visit connection_path(@connection)
    end

  scenario "Fill in message form" do
    fill_in('content', :with => 'This is a new message right here')
    click_on('Send')
    expect(page).to have_content('This is a new message right here')
  end

end

