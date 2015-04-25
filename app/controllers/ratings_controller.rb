class RatingsController < ApplicationController
  before_filter :get_course

  def index
    @ratings = @course.ratings
    render "index", layout: false 
  end

  def show
    @rating = get_rating
    render "show", layout: false
  end

  def create
    @rating = @course.ratings.build(rating_params)

    if @rating.save
      redirect_to course_path @course, notice: 'Post was successfully created.'
    else
      render :new
    end

  end

  def destroy
    @rating = get_rating
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
    @course = Course.find(params[:course_id])
  end

  def rating_params
    params.require(:ratings).permit(:rating)
  end
end
