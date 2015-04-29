class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_connection
  before_filter :get_course
  before_filter :allow_user


  def create
    @rating = @course.ratings.new(rating_params)
    if @rating.save
      render partial: 'show', layout: false
    end

  end

  private

  def get_course
    @course = @connection.courses.find(params[:course_id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def rating_params
    params.permit(:rating, :rating_type)
  end

  def allow_user
    redirect_to user_path current_user unless @connection.belongs_to? current_user
  end

end
