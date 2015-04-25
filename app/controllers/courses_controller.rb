class CoursesController < ApplicationController

  before_filter :get_connection
  before_filter :get_users, only: [:update,:edit]

  def show
    # @course =
  end

  def create
      @skill = Skill.new(params[:skill])
      tags = params[:tags]
      weights = params[:weights]

      tags.each_with_index do |tag, index|
        tag = Tag.create :name => tag
        Skill.create :tag_id => tag.id, :weight => weights[index]
      end
    end

  def create
    @course = Course.new(connection_id:params[:connection_id], learner_id: User.find(params[:Learner]).id, tutor_id: User.find(params[:Tutor]).id, title:params[:title], price:params[:price], length:params[:length])

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
    if @course.update(course_params.merge(get_learner))
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  private

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
