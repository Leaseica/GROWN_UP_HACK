module UsersHelper
  def user_avatar(user)
    if user.avatar.attached?
      cl_image_path user.avatar.key, class: "avatar-bordered", alt: "avatar"
    else
      image_tag("avatar/cat.png", class: "avatar-bordered", alt: "avatar")
    end
  end
end
