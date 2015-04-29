class UsersController < ApplicationController

  before_action :authenticate_user!, only: :mail

  def index
    @users = User.search(params[:search])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    get_user
    get_user_connections
    get_user_connection
    @skills = @user.skills
  end

  def mail
    get_user
    SkillMailer.skill_add(@user.skills.first).deliver_now
    redirect_to user_path @user
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def get_user_connections
    if current_user
      @connections = @user.initializer_connections + @user.receiver_connections
    end
  end

  def get_user_connection
    @connection = Connection.find_by(receiver_id: current_user.id, initializer_id: params[:id]) || Connection.find_by(receiver_id: params[:id], initializer_id: current_user.id)
  end

end
