class StaticPagesController < ApplicationController

  def index

  end

  def feed
    @all_connections = Connection.limit(10).order('created_at DESC')
    @all_courses = Course.limit(10).order('created_at DESC')
    @new_users = User.limit(10).order('created_at DESC')
    @feed_items = (@new_users).sort_by &:created_at
    @feed_items.reverse!
  end

  def map
   puts params[:id]
   @user = User.find(params[:id])
   respond_to do |format|
   # format.html
   format.json {render json: @user, status: :ok}


   end
  end

end
