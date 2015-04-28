class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_filter :get_user, only:[:show, :edit, :update, :destroy]
  before_filter :get_user_connection, only:[:show]

  def index
    @users = User.all
    if params[:search]
      @users = ( User.search(params[:search]) )
    else
      @users = ( User.all )
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @learning_skills = @user.skills.learning_skills
    @teaching_skills = @user.skills.teaching_skills
  end

  def list
    # @users = User.all
    if params[:search]
      @users = (User.search(params[:search]))
    else
      @users = (User.all)
    end
  end

  private
  def user_params
    params.require(:user).permit(:all)
  end

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
