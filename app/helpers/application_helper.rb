module ApplicationHelper

  def sign_in_or_out_link
    if signed_in?
      button_to 'Sign Out', destroy_user_session_path, method: :delete, class: 'btn nav-link'
    else
      link_to 'Sign In', new_user_session_path, class: 'nav-link'
    end
  end

end
