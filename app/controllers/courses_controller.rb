class CoursesController < ApplicationController

  before_action :authenticate_user!
  before_filter :get_connection
  before_filter :get_course, except: :create
  before_filter :get_users, only: [:update,:edit]
  before_filter :allow_user

  def show
  end

  def edit
  end

  def destroy
    @course.destroy
    redirect_to connection_path(@course.connection_id)
  end

  def create
    @course = @connection.courses.new(course_params)
    if @course.save
      create_learning_objectives(params[:learningObjectives])
      redirect_to connection_path(@course.connection_id)
    else
      redirect_to :back
    end
  end

  def update
    if @course.update(course_params)
      create_learning_objectives(params[:learningObjectives])
      update_learning_objectives(params[:course][:objectives])
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  private

  def create_learning_objectives(params)
    if params
      params.each do |lo|
        @course.learning_objectives.create(objective: lo) unless lo.strip ==''
      end
    end
  end

  def update_learning_objectives(params)
    if params
      params.each do |id, lo|
        objective = @course.learning_objectives.find(id)
        lo.strip =='' ? objective.destroy : objective.update(objective: lo)
      end
    end
  end

  def allow_user
    redirect_to user_path current_user unless @connection.belongs_to? current_user
  end

  def get_course
    @course = @connection.courses.find(params[:id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def course_params
    params.require(:course).permit(:price, :title, :status, :learner_id, :tutor_id, :length, :objectives)
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
