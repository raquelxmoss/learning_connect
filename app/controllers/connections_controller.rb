class ConnectionsController < ApplicationController

  before_action :authenticate_user!
  before_filter :get_connection, only: [:show, :destroy]
  before_filter :get_initializer, only: [:new, :create]

  def create
    @receiver = User.find(params[:receiver_id]) #this is the user whose profile page they are looking at
    @connection = Connection.new(receiver_id: @receiver.id, initializer_id: @initializer)
    #if you are going to redirect back you don't need the if
    if @connection.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def show
    @users = [@connection.initializer, @connection.receiver]

    #it would be just as easy to put @connection.courses and @connection.messages in your view
    @courses = @connection.courses
    @messages = @connection.messages

    @course = Course.new
  end

  def new
    @receiver = User.find(params[:id]) #this is the user whose profile page they are looking at
    @connection = Connection.new(receiver_id: @receiver.id, initializer_id: @initializer)
  end

  def destroy
    if @connection.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to :back
    end
  end

  private
  def connection_params
    params.require(:connection).permit(:all)
  end

  def get_connection
    @connection = Connection.find(params[:id])
  end

  def get_initializer
    @initializer = current_user.id
  end

end
