class ConnectionsController < ApplicationController

  before_action :authenticate_user!
  before_filter :get_connection, only: [:show, :destroy]

  def create
    get_initializer
    @receiver = User.find(params[:receiver_id]) 
    @connection = Connection.new(receiver: @receiver, initializer: @initializer)
    if @connection.save
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  def show
    if @connection.belongs_to? current_user
      @users = [@connection.initializer, @connection.receiver]
      @courses = @connection.courses
      @messages = @connection.messages
      @course = Course.new
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @connection.destroy
    redirect_to user_path(current_user)
  end

  private
  def connection_params
    params.require(:connection).permit(:all)
  end

  def get_connection
    @connection = Connection.find(params[:id])
  end

  def get_initializer
    @initializer = current_user
  end

end