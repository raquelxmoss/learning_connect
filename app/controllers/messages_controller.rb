class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(content:params[:content], connection_id:params[:connection_id], user_id:params[:user_id])
    if @message.save
      render partial: 'show', layout: false
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      render json: @message, status: :ok
    else
      render json: @message, status: :unprocessable_entity
    end
  end

end