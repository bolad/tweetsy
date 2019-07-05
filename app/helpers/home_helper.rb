module HomeHelper
  def user_signed_in?
    session['userinfo'].present?
  end

  def authenticate_user!
    if user_signed_in?
      @current_user = session['userinfo']
    else
      redirect_to login_path
    end
  end

  def current_user
    @current_user
  end

  def greeting
    if current_user.present?
      @greeting = "Welcome, #{current_user['info']['name'].split.first}!"
      @link = packs_path
    else
      @greeting = 'Tweetsy'
      # @link = '/welcome'
    end
  end

  def login_or_out
    if current_user.present?
      link_to('Log Out', logout_path, class: 'nav-link')
    else
      link_to('Log In', '/auth/twitter', class: 'nav-link')
    end
  end

  def menu_items
    link_to 'Packs', packs_path if current_user.present?
  end
end
