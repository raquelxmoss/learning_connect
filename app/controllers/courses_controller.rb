class CoursesController < ApplicationController

  def show
  end

  def create
    @course = Course.new(connection_id:params[:connection_id], learner_id:params[:learner_id], tutor_id:params[:tutor_id], title:params[:title], price:params[:price])
  end

  def new
  end

end
