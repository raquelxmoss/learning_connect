class LearningObjectivesController < ApplicationController
  before_filter :get_course

  def index
    @learning_objectives = @course.learning_objectives
    render "index", layout: false 
  end

  def show
    @learning_objective = get_learning_objective
    render "show", layout: false
  end

  def create
    @learning_objective = @course.learning_objectives.build(learning_objective_params)

    if @learning_objective.save
      format.html { redirect_to course_path @course, notice: 'Post was successfully created.' }
    else
      format.html { render :new }
    end

  end

  def destroy
    @learning_objective = get_learning_objective
    if @learning_objective.destroy
      render json: @learning_objective, status: :ok
    else
      render json: @learning_objective, status: :unprocessable_entity
    end
  end

  private

  def get_learning_objective
    @course.learning_objectives.find(params[:id])
  end

  def get_course
    @course = Course.find(params[:course_id])
  end

  def learning_objective_params
    params.require(:learning_objective).permit(:objective)
  end

end
