class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(content:params[:content], connection_id:params[:connection_id], user_id:params[:user_id])
    if @message.save
      @messages = Connection.find(params[:connection_id]).messages
      render 'index', layout: false
    else
      render json: @message, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end


end