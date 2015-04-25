class LearningObjectivesController < ApplicationController
  before_filter :get_course




  private

  def get_course
    @course = Course.find(params[:course_id])
    @learning_objectives = @course.learning_objectives
  end

end
