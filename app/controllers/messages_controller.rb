class MessagesController < ApplicationController
  before_filter :find_message, only: [:show, :destroy]

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render partial: 'show', layout: false
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def show
    render json: @message
  end

  def destroy
    if @message.destroy
      render json: @message, status: :ok
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.permit(:connection_id, :user_id, :content)
  end

end