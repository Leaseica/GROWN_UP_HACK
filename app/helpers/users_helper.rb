module UsersHelper
  def display_user_name(user)
    if user.has_a_name? == "Aucun nom fourni" && controller_name == "users" && action_name == "show"
      # Container for user profile display
      content_tag(:div, class: 'profile-banner') do
        # Avatar image
        concat(image_tag("avatar/incognito.svg", class: "avatar-bordered"))
        # Container for text
        concat(content_tag(:div, class: 'ms-3') do
          content_tag(:div, "Anonymous", class: "text-start title xl ms-2") +
          content_tag(:div, "- Un profil complet, c'est comme un espresso: instantanément efficace!", class: "quote")
        end)
      end
    else
      # Display for other users
      content_tag(:div, class: 'profile-banner') do
        image_tag("avatar/cat.png", class: "avatar-bordered", alt: "User avatar") +
        content_tag(:span, "#{user.has_a_name?}", class: "title xl ms-3")
      end
    end
  end
end
