class CoursesController < ApplicationController

  before_filter :get_connection

  def show
    # @course = 
  end

  def create
    @course = Course.new(connection_id:params[:connection_id], learner_id: User.find(params[:Learner]).id, tutor_id: User.find(params[:Tutor]).id, title:params[:title], price:params[:price], length:params[:length])
    if @course.save
      redirect_to :back
    else
      #add an error message
    end
  end

  def edit
    @course = @connection.courses.find(params[:id])
    @users = [@connection.initializer, @connection.receiver]
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to :back
    else
      render 'edit'
    end
  end

  private

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def course_params
    params.require(:courses).permit(:learner_id, :tutor_id, :title, :price, :length)
  end

end
