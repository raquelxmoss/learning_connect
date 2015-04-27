class CoursesController < ApplicationController

  before_filter :get_connection, only: [:create, :show, :edit, :update]
  before_filter :get_course, only: [:update, :edit, :show]
  before_filter :get_users, only: [:update,:edit]

  def show
  end

  def create
    # raise course_params.inspect
    @course = Course.new(course_params)
    @course.connection_id = params[:connection_id]
    # this needs refactoring, it is a total hack - Raquel
    if @course.save!
      if params[:learningObjectives]
        learning_objectives = params[:learningObjectives]
        learning_objectives.each_with_index do |lo, index|
          @course.learning_objectives << LearningObjective.create(objective: lo)
        end
      end
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def edit

  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to :root
  end

  def update
    # this needs refactoring, it is a total hack - Raquel
    if @course.update(course_params)
      # if params[:learningObjectives]
      #   learning_objectives = []
      #   params[:learningObjectives].each {|id| learning_objectives << LearningObjective.find(id)}
      #   learning_objectives.each_with_index {|objective, i| objective.update(objective:params[:learningObjectives][i])}
      # end
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  private

  def get_course
    @course = @connection.courses.find(params[:id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def course_params
    params.require(:course).permit(:price, :title, :status, :learner_id, :tutor_id, :length)
  end

  def get_users
    @users = [@connection.initializer, @connection.receiver]
  end

  def remove_tutor_id
    return id = @users.select{|user| user.id != params[:course][:tutor_id].to_i}.first.id
  end

  def get_learner
    {"learner_id" => remove_tutor_id }
  end

end
