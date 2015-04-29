require 'rails_helper'

feature "Rate other user", js: true do

  background do
      @tutor = create(:user)
      @learner = create(:user)
      @connection = Connection.create(initializer_id:@tutor.id, receiver_id: @learner.id)
      @lesson = @connection.courses.create(learner_id: @learner.id, tutor_id: @tutor.id, title: "Spanish Lesson", length: 3, price: 20)
      sign_in_as @tutor
      visit connection_course_path(@connection.id, @lesson.id)
    end

  scenario "Form doesn't show if course status is pending" do
    expect(page).not_to have_content('time to rate')
  end

  scenario "Form doesn't show if course status is agreed" do
    @lesson.update(status:'agreed')
    expect(page).not_to have_content('time to rate')
  end

  scenario "Tutor can rate learner" do
    @lesson.update(status:'complete')
    visit connection_course_path(@connection.id, @lesson.id)
    expect(page).to have_content("it's time to rate your learner")
  end

  scenario "Learner can rate tutor" do
    sign_out
    sign_in_as @learner
    @lesson.update(status:'complete')
    visit connection_course_path(@connection.id, @lesson.id)
    expect(page).to have_content("it's time to rate your tutor")
  end

end
