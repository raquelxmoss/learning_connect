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
    get_user_connections
    @skills = @user.skills
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

end
