class UsersController < ApplicationController

  def index
    @users = User.search(params[:search])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    get_user
    get_user_connection
    @learning_skills = @user.skills.learning_skills
    @teaching_skills = @user.skills.teaching_skills
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def get_user_connection
    if current_user
      @connection = Connection.find_by(initializer_id:current_user.id, receiver_id: @user.id) || @connection = Connection.find_by(initializer_id:@user.id, receiver_id: current_user.id)
      @connections = @user.initializer_connections + @user.receiver_connections
    end
  end

end
