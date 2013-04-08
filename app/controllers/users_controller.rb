class UsersController < ApplicationController
  before_filter :load_variables, only: [:edit, :destroy, :update]
  before_filter :edit_or_update?, only: [:edit, :destroy, :update]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.includes([:votes => [:topic_link => [:link, :topic => :category]]],
                          [:topic_links => [:link, :topic => [:best_link, :category]]],
                          [:twitter_auth]).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to request.referrer, notice: "Thanks!"
    else
      render "new", notice: "Error"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def twitter_auth
    auth = env['omniauth.auth']
    current_user.link_twitter(auth)
    TwitterWorker.perform_async(current_user.id)
    redirect_to current_user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root }
      format.json { head :no_content }
    end
  end

  private

    def load_variables
      @user = User.find(params[:id])
    end

    def edit_or_update?
      redirect_to user_path , notice: "You are not authorized to do that!" unless same_user_or_admin?
    end

end