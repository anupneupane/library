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
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def has_admin_privileges?
    current_user && current_user.admin?
  end
  helper_method :has_admin_privileges?

  def admin_authorize
    redirect_to root_path, notice: "Need admin privileges" unless has_admin_privileges?
  end

  def creator_authorize
    redirect_to login_path, alert: "Not authorized, please login" if current_user.nil?
  end

  # no longer necessary
  # def is_admin?
  #   !logged_in? || !current_user.admin?
  # end


  # def creator?
  # end
end
