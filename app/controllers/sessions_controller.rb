class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to root_path, notice: "Logged In!"
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged Out!"
  end
end
