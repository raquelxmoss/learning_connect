class CoursesController < ApplicationController

  before_filter :get_connection
  before_filter :get_course, only: [:update, :edit, :destroy]
  before_filter :get_users, only: [:update,:edit]

  def show
    # @course =
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      learning_objectives = params[:learningObjectives]
      learning_objectives.each_with_index do |lo, index|
        @course.learning_objectives << LearningObjective.create(objective: lo)
      end
      redirect_to :back
    else
      #add an error message
    end
  end

  def edit
    @course = @connection.courses.find(params[:id])
  end

  def update
    @course = @connection.courses.find(params[:id])
    learning_objectives = []
    params[:lo_id].each {|id| learning_objectives << LearningObjective.find(id)}
    learning_objectives.each_with_index {|objective, i| objective.update(objective:params[:learningObjectives][i])}
    if @course.update(course_params.merge(get_learner))
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  private

  def get_course
    @course = Course.find(params[:id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def course_params
    params.permit(:price, :title, :status, :learner_id, :tutor_id, :length, :connection_id)
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
