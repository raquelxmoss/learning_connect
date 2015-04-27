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
end
