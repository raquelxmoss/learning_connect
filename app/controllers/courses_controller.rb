class CoursesController < ApplicationController

  def show
  end

  def create
    @course = Course.new(connection_id:params[:connection_id], learner_id: User.find(params[:Learner]).id, tutor_id: User.find(params[:Tutor]).id, title:params[:title], price:params[:price])
    if @course.save
      redirect_to :back
    else
      #add an error message
    end
  end

  def new
  end

end
