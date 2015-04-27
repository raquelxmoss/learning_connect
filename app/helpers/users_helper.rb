module UsersHelper

  def can_edit_profile?(user)
    user_signed_in? && current_user.id == user.id
  end

  def render_feed_item(item)
    #render user feed partial
    render partial: 'user/feed_item'

    #elsif feed item type = Connection
    #render feed item partial
    #elsif feed itme type = Course
    #render feed item for course
  end

end
