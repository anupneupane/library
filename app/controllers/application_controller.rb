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
    logged_in? && current_user.admin?
  end
  helper_method :has_admin_privileges?

  private

    def check_if_admin
      redirect_to root_path, notice: "Need admin privileges" unless has_admin_privileges?
    end

    def check_if_logged_in
      redirect_to login_path, notice: "Please Log In" unless logged_in?
    end

end