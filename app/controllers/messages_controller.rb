class MessagesController < ApplicationController

  def create
    @message = Message.new(content:, connection_id:, user_id:)
    if @message.save
      #render connection page with messages
    else
    end
  end

  def show
    #render as json
  end


end