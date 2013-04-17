class UsersController < ApplicationController
  #before_filter :load_user
  before_filter :edit_or_update?, only: [:edit, :destroy, :update]

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.includes([:votes =>
                            [:topic_link =>
                              [:link, :topic => [:category => :channel]]
                            ]
                          ],
                          [:topic_links =>
                            [:link,
                            :topic =>
                              [:category=>
                                [:channel]
                              ]
                            ]
                          ],
                          [:topics =>
                            [:category=>[:channel], :best_link => [:link]]
                          ],
                          [:twitter_auth]).find(params[:id])

    TwitterFriendWorker.perform_async(@user.id)
    @friends_upvoted_links = TopicLink.includes(:link, :voters, :topic => [:category => [:channel]], :votes => [:user]).where(votes: {user_id: @user.friends.collect{|u|u.id}, status:1}).limit(5).flatten
    @friends_downvoted_links = TopicLink.includes(:link, :voters, :topic => [:category => [:channel]], :votes => [:user]).order().where(votes: {user_id: @user.friends.collect{|u|u.id}, status:-1}).limit(5).flatten

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    render template:'modals/signup-modal', layout: false
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    session[:prior_page] ||= request.referrer
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to session[:prior_page], notice: "Thanks!"
      session.delete(:prior_page)
    else
      render "new"
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
    TwitterFriendWorker.perform_async(current_user.id)
    TwitterFollowerWorker.perform_async(current_user.id)
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
    def edit_or_update?
      @user = User.find(params[:id])
      redirect_to user_path, notice: "You are not authorized to do that!" unless same_user_or_admin?
    end

end
