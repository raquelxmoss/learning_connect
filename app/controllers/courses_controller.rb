class CoursesController < ApplicationController

  def show
  end

  def create
    @course = Course.new(connection_id: , learner_id: , tutor_id:, title:, status: )
  end

  def new
  end

end
