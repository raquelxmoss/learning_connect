require 'rails_helper'

feature "Create course", js: true do

  background do
      @tutor = create(:user)
      @learner = create(:user)
      @connection = Connection.create(initializer_id:@tutor.id, receiver_id: @learner.id)
      sign_in_as @tutor
      visit connection_path(@connection)
    end

  scenario "visit connection page" do
    expect(current_path).to eq(connection_path(@connection))
  end

  scenario "click Create a lesson" do
    expect(current_path).to eq(connection_path(@connection))
    expect(page).to have_content("Create a lesson")
    click_on("Create a lesson")
    page.has_css?('#new-lesson-form', :visible => true)
  end

  scenario "Create lesson form creates a lesson" do
    click_on("Create a lesson")
    fill_in('Title', :with => 'New Lesson')
    fill_in('Price', :with => '20')
    select(@tutor.name, :from => 'Tutor')
    fill_in('Length', :with => '1')
    click_on("Create Course")
    click_on("All Lessons")
    expect(page).to have_content("New Lesson")
  end

  scenario "click Add Learning Objective" do
    click_on("Create a lesson")
    click_on("Add a Learning Objective")
    page.has_css?('#new-learning-objectives', :visible => true)
  end

end

