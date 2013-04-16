class TopicsController < ApplicationController
  before_filter :load_user
  before_filter :check_if_logged_in, :except => [:show, :index]
  before_filter :topic_admin_or_creator, :only => [:update, :destroy, :edit]

  # GET /topics
  # GET /topics.json
  # def index
  #   @topics = Topic.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @topics }
  #   end
  # end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.includes(:user, :category => [:topics, :channel =>[:categories=>[:topics]]], :topic_links=>[:link, :user]).find(params[:id])
    #@friend_votes = @topic.topic_links.votes.includes([:user]).where(votes:{user_id: current_user.collect_friend_ids})
    @topic_links = @topic.topic_links
    @category = @topic.category
    @channel = @category.channel
    @topic_link = TopicLink.new
    @link = @topic_link.build_link
    @request_url = {url: topic_links_path(@topic.id)}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new
    @channel = Channel.find(params[:channel_id])
    render template:'modals/topic-submit', layout:false
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = current_user.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @category = @topic.category
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to @category }
      format.json { head :no_content }
    end
  end

  private
    def topic_admin_or_creator

      @topic = Topic.find(params[:id])
      redirect_to @topic, notice: "You are not authorized to do that!" if ! @topic.authorize?(current_user)
    end
end
