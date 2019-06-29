class SessionController < ApplicationController
  def create
    session[:userinfo] = request.env['omniauth.auth']
    # user = User.from_omniauth(env["omniauth.auth"])
    redirect_to  dashboard_path
  end

  def destroy
    reset_session
    # redirect_to root_path
  end

  def failure
    render plain: 'Authentication failed.'
  end
end
