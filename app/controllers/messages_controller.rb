class MessagesController < ApplicationController

  def create
    @message = Message.new(content:params[:content], connection_id:params[:connection_id], user_id:params[:user_id])
    if @message.save
      render json: @message
    else
    end
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end


end