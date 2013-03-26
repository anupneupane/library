class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def logged_in?
    true if current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_user_logged_in?
    true if current_user != nil
  end
  helper_method :current_user_logged_in?

end
