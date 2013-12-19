module SessionsHelper

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout
    if current_user
      current_user.reset_session_token
      current_user.save
    end
    session[:session_token] = nil
  end


end
