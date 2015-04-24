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

  def edit
    @course = Course.find(params[:id])
    @connection = @course.connection
    @users = [@connection.initializer, @connection.receiver]
  end

  def update
    @course = Course.find(params[:id])
    # @course.update(params)
  end

end
