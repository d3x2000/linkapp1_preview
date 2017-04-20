module CommentsHelper
  def get_user(comment)
    user = User.where(id: comment.user_id).first
    user.username
  end

  def get_avatar(user_id)
    user = User.where(id: user_id).first
    if user.avatar == ""
      img = "avatar.png"
    else
      user.avatar
    end
  end
end
