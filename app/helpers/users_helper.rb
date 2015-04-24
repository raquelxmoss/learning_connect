module UsersHelper

  def can_edit_profile?(user)
    user_signed_in? && current_user.id == user.id
  end
end
