class RatingsController < ApplicationController
  before_filter :get_connection
  before_filter :get_course
  before_filter :get_rating, only: :destroy

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      @course = @rating.course
      render partial: 'show', layout: false
    else
      render :new
    end

  end

  def destroy
    if @rating.destroy
      render json: @rating, status: :ok
    else
      render json: @rating, status: :unprocessable_entity
    end
  end

  private

  def get_rating
    @course.ratings.find(params[:id])
  end

  def get_course
    @course = @connection.courses.find(params[:course_id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def rating_params
    params.permit(:rating, :course_id, :rating_type)
  end
end
