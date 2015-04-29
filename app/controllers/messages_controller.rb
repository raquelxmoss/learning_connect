class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_filter :get_connection
  # before_filter :allow_user
  before_filter :get_message, only: :destroy

  def create
    @message = @connection.messages.new(message_params)
    if @message.save
      render partial: 'show', layout: false
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def destroy
    if @message.destroy
      render json: @message, status: :ok
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  private

  def allow_user
    redirect_to user_path current_user unless @connection.belongs_to? current_user
  end

  def get_message
    @message = @connection.messages.find(params[:id])
  end

  def get_connection
    @connection = Connection.find(params[:connection_id])
  end

  def message_params
    params.permit(:user_id, :content)
  end

end