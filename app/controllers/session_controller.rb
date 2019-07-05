class SessionController < ApplicationController
  def create
    session['userinfo'] = request.env['omniauth.auth']

    User.from_omniauth(session['userinfo'])

    TweetsWorker.perform_async

    redirect_to packs_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def failure
    render plain: 'Authentication failed.'
  end
end
