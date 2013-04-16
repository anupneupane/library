class SessionsController < ApplicationController
  def new
    @user = User.new
    render template:'modals/login-modal', layout: false
    if current_user
      redirect_to root_path
    end
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      login(user)
      TwitterFriendWorker.perform_async(user.id)
      redirect_to request.referrer, notice: "Logged In!"
    else
      flash[:error] = "Email or password is invalid"
      @user = User.new
      redirect_to request.referrer
    end
  end

  def destroy
    logout
    redirect_to request.referrer, notice: "Logged Out!"
  end
end
