class ConnectionsController < ApplicationController

  before_action :authenticate_user!
  before_filter :get_connection, only: [:show, :destroy]
  before_filter :allow_user, except: :create

  def create
    @connection = Connection.new(set_options)
    if @connection.save
      # NotificationMailer.new_connection(@receiver, @connection).deliver_now
      redirect_to connection_path @connection
    else
      redirect_to :back
    end
  end

  def show
      @users = [@connection.initializer, @connection.receiver]
      @courses = @connection.courses
      @messages = @connection.messages
      @course = Course.new
  end

  def destroy
    @connection.destroy
    redirect_to user_path(current_user)
  end

  private

  def get_connection
    @connection = Connection.find(params[:id])
  end

  def allow_user
    redirect_to user_path current_user unless @connection.belongs_to? current_user
  end

  def set_options
    @initializer = current_user
    @receiver = User.find(params[:receiver_id])
    {initializer: @initializer, receiver: @receiver}
  end

end