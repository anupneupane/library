class TopicLinksController < ApplicationController
  before_filter :load_user
  before_filter :check_if_logged_in
  before_filter :load_topic_link, :only => [:update, :destroy, :edit]
  before_filter :tl_admin_or_creator, :only => [:update, :destroy, :edit]

  
  # GET /topic_links/new
  # GET /topic_links/new.json
  def new
    @topic_link = TopicLink.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic_link }
    end
  end

 # when editing a topic link, want to check if edited topic_link already exists.  if it already
 # exists, then we want to make the edited link_link_id = to the existing topic_link_link_id

  # GET /topic_links/1/edit
  def edit
    @topic_link = TopicLink.find(params[:id])
    @topic = @topic_link.topic
    @category = @topic_link.topic.category
    @link = @topic_link.link
    @request_url = {url: topic_link_path(@topic.id, @topic_link)}
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @topic_link }
    end
  end

  # POST /topic_links
  # POST /topic_links.json
  def create
    @link = Link.new(url: params[:link][:url].strip.downcase)
    @link.prepend_http
    @topic = Topic.includes(:category => :channel).find(params[:topic_id])  
    @topic_link = TopicLink.new(params[:topic_link])
    @topic_link.topic = @topic
    @topic_link.user = current_user

    if @link.is_valid? 
      @topic_link.link = @link
      @topic_link.create_associate_or_reject_link
      redirect_to @topic
    else 
      redirect_to @topic
      flash[:error] = "Invalid URL"
      
    end
  end

  # PUT /topic_links/1
  # PUT /topic_links/1.json
  def update
    @submitted_link = Link.new(url: params[:link][:url].strip.downcase)
    @submitted_link.prepend_http
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:id])
    @topic_link.update_attributes(params[:topic_link])
    @link = @topic_link.link

    if @submitted_link.is_valid? 
      @topic_link.link = @submitted_link
      @topic_link.create_associate_or_reject_link
      if @link.topic_links.length <1
        @link.destroy
      end
      redirect_to @topic
    else 
      flash[:error] = "Invalid URL"
      @request_url = {url: topic_link_path(@topic.id, @topic_link)}
      render 'topic_links/edit'
    end
  end

  # DELETE /topic_links/1
  # DELETE /topic_links/1.json
  def destroy
    @topic_link = TopicLink.find_by_id(params[:id])
    @link = Link.find_by_id(@topic_link.link_id)
    @topic = @topic_link.topic
    @topic_link.destroy
    @link.destroy if TopicLink.where(link_id: @topic_link.link_id).length == 0

    respond_to do |format|
      format.html { redirect_to @topic }
      format.json { head :no_content }
    end
  end

  private

    def tl_admin_or_creator
      redirect_to root_path, notice: "You are not authorized to do that!" if (! @topic_link.authorize?(current_user))
    end
end
