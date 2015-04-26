class LearningObjectivesController < ApplicationController
  before_filter :get_course
  before_filter :get_learning_objective, only: [:show, :destroy]

  def index
    @learning_objectives = @course.learning_objectives
    render "index", layout: false
  end

  def show
    render "show", layout: false
  end

  def create
    @learning_objective = @course.learning_objectives.build(learning_objective_params)

    if @learning_objective.save
      redirect_to course_path @course, notice: 'Post was successfully created.'
    else
      render :new
    end

  end

  def destroy
    if @learning_objective.destroy
      render json: @learning_objective, status: :ok
    else
      render json: @learning_objective, status: :unprocessable_entity
    end
  end

  private

  def get_learning_objective
    @learning_objective = @course.learning_objectives.find(params[:id])
  end

  def get_course
    @course = Course.find(params[:course_id])
  end

  def learning_objective_params
    params.require(:learning_objectives).permit(:objective)
  end

end
