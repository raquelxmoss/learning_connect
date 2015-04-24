class ConnectionsController < ApplicationController

  before_action :authenticate_user!

  def create
    @initializer = current_user.id
    @receiver = User.find(params[:receiver_id]) #this is the user whose profile page they are looking at
    @connection = Connection.new(receiver_id: @receiver.id, initializer_id: @initializer)
    if @connection.save
      redirect_to connections_path
    else
      render users_path(@receiver)
    end
  end

  def show
  end

  def new
    @initializer = current_user.id
    @receiver = User.find(params[:id]) #this is the user whose profile page they are looking at
    @connection = Connection.new(receiver_id: @receiver.id, initializer_id: @initializer)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def connection_params
    params.require(:connection).permit(:all)
  end

end