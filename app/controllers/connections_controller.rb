class ConnectionsController < ApplicationController

  before_action :authenticate_user!

  def create
  end

  def show
  end

  def new
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