class SessionController < ApplicationController
  def create
    session['userinfo'] = request.env['omniauth.auth']

    User.from_omniauth(session['userinfo'])

    redirect_to dashboard_path
  end

  def destroy
    reset_session
  end

  def failure
    render plain: 'Authentication failed.'
  end
end
