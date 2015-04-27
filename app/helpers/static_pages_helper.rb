module StaticPagesHelper

  def render_feed_item(item)

    #render user feed partial
    render partial: 'user/feed_item'

    #elsif feed item type = Connection
    #render feed item partial
    #elsif feed itme type = Course
    #render feed item for course
  end

end
