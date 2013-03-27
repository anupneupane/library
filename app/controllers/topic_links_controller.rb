class TopicLinksController < ApplicationController

  before_filter :load_topic_link, :only => [:update, :destroy, :edit]
  before_filter :authorize_topic_link, :only => [:update, :destroy, :edit]
  before_filter :logged_in?, :only => [:new]

  # GET /topic_links
  # GET /topic_links.json
  def index
    @topic_links = TopicLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topic_links }
    end
  end

  # GET /topic_links/1
  # GET /topic_links/1.json
  def show
    @topic_link = TopicLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic_link }
    end
  end

  # GET /topic_links/new
  # GET /topic_links/new.json
  def new
    @topic_link = TopicLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic_link }
    end
  end

  # GET /topic_links/1/edit
  def edit
    @topic_link = TopicLink.find(params[:id])
  end

  # POST /topic_links
  # POST /topic_links.json
  def create
    @topic = Topic.find(params[:topic_id])
    url = Link.normalize_url(params[:link][:url])
    @link = Link.find_by_url(url) 
    @tl = @topic.topic_links.build(params[:topic_link])
    @tl.user = current_user
    
    if @link && @topic.includes_link?(@link)
      notice = "#{@link.url} is already a link for this topic"
    elsif @link
      @tl.link = @link
      notice = ("#{@link.url} is now associated with this topic" if @tl.save) || "Make sure you enter a title and description"
    else
      @link = @tl.build_link(url: url)
      notice = ("#{@link.url} has been added to the topic" if @tl.save) || "Make sure you enter a title and description"
    end

    respond_to do |format|
      format.html { redirect_to @topic, notice: notice }
      format.json { render json: @topic, status: :created, location: @topic }
    end
  end

  # PUT /topic_links/1
  # PUT /topic_links/1.json
  def update
    @topic_link = TopicLink.find(params[:id])

    respond_to do |format|
      if @topic_link.update_attributes(params[:topic_link])
        format.html { redirect_to @topic_link.topic, notice: 'TopicLink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topic_links/1
  # DELETE /topic_links/1.json
  def destroy
    @topic_link = TopicLink.find(params[:id])
    @topic_link.destroy
    @topic = @topic_link.topic

    respond_to do |format|
      format.html { redirect_to @topic }
      format.json { head :no_content }
    end
  end
  private
    def load_topic_link
      @topic_link = TopicLink.find(params[:topic_link_id] || params[:id])
    end

    def authorize_topic_link
      redirect_to login_path, alert: "Not authorized, please login" if (! @topic_link.authorize?(current_user))
    end
end
