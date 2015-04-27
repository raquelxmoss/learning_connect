class RatingsController < ApplicationController
  before_filter :get_course, only: [:index, :show, :destroy]

  def index
    @ratings = @course.ratings
    render "index", layout: false
  end

  def show
    @rating = Rating.new
    @rating = get_rating
    render "show", layout: false
  end

  def create
    @rating = Rating.new(rating_params)
    # @course.ratings.build(rating_params)

    if @rating.save
      @course = @rating.course
      render partial: 'show', layout: false
    else
      render :new
    end

  end

  def new
    @rating = Rating.new
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
    puts params
    params.permit(:rating, :course_id, :rating_type)
  end
end
