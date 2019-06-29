module HomeHelper
  def user_signed_in?
    session['userinfo'].present?
  end

  def authenticate_user!
    if user_signed_in?
      @current_user = session['userinfo']
    else
      redirect_to root_path
    end
  end

  def current_user
    @current_user
  end

  # def reset_session
  #   session['userinfo'] = nil if session['userinfo'].present?
  # end

  def greeting
    if current_user.present?
      @greeting = "Welcome, #{current_user['info']['name'].split.first}!"
      # @link = dashboard_path
    else
      @greeting = 'Tweetsy'
      @link = root_path
    end
  end

  def login_or_out
    if current_user.present?
      link_to('Log Out', logout_path, class: 'nav-link')
    else
      link_to('Log In', "/auth/twitter", class: 'nav-link')
    end
  end
end
