class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # 
  # protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout! 
    @current_user = nil 
    session[:session_token] = nil
  end 
  
  def require_login
    redirect_to new_user_url unless current_user
  end


end
