class TopicLinksController < ApplicationController
  before_filter :check_if_logged_in, :except => [:show, :index]
  before_filter :load_topic_link, :only => [:update, :destroy, :edit]
  before_filter :tl_admin_or_creator, :only => [:update, :destroy, :edit]
  
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

 # when editing a topic link, want to check if edited topic_link already exists.  if it already
 # exists, then we want to make the edited link_link_id = to the existing topic_link_link_id

  # GET /topic_links/1/edit
  def edit
    @topic_link = TopicLink.find(params[:id])
    @category = @topic_link.topic.category
  end

  # POST /topic_links
  # POST /topic_links.json
  def create
    @topic = Topic.find(params[:topic_id])
    url = Link.normalize_url(params[:link][:url])
    @link = Link.find_by_url(url) 
    @tl = @topic.topic_links.build(params[:topic_link])
    @tl.user = current_user
    
    if url == "http://" || url == "https://"
      notice = "URL field may not be blank."
    elsif Link.check_suffix(url) == false
      flash[:notice] = "Invalid URL"
    elsif @link && @topic.includes_link?(@link)
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
    submitted_link_url = Link.normalize_url(params[:topic_link][:link_attributes][:url])
    @existing_link = Link.find_by_url(submitted_link_url)
    @topic = Topic.find(params[:topic_id])
    if submitted_link_url == "http://" || submitted_link_url == "https://"
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @topic_link.errors, status: :unprocessable_entity }
      end
    elsif @existing_link && @topic.includes_link?(@existing_link)
      respond_to do |format|
        format.html { redirect_to @topic_link.topic, notice: "#{@existing_link.url} is already a link for this topic" }
        format.json { head :no_content }
      end
    else
      @existing_topic_link = TopicLink.find(params[:id])
      number_of_times_submitted_link_repeats_in_database = TopicLink.where(link_id: params[:topic_link][:link_attributes][:id]).length
      @existing_topic_link.update_attributes(title: params[:topic_link][:title], description: params[:topic_link][:description])
      if number_of_times_submitted_link_repeats_in_database == 1
        if @existing_link
          Link.find_by_id(@existing_topic_link.link_id).destroy
          @existing_topic_link.update_attributes(link_id: Link.find_by_url(submitted_link_url).id)
        else
          Link.find_by_id(params[:topic_link][:link_attributes][:id]).update_attributes(url: submitted_link_url)
        end
      else
        if @existing_link
          @existing_topic_link.update_attributes(link_id: Link.find_by_url(submitted_link_url).id)
        else
          @link = Link.new(url: submitted_link_url)
          @link.save
          @existing_topic_link.update_attributes(link_id: @link.id)
        end
      end
      respond_to do |format|
        format.html { redirect_to @topic_link.topic, notice: "Link was successfully updated." }
        format.json { head :no_content }
      end
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
    def load_topic_link
      @topic_link = TopicLink.find(params[:topic_link_id] || params[:id])
    end

    def tl_admin_or_creator
      redirect_to root_path, notice: "You are not authorized to do that!" if (! @topic_link.authorize?(current_user))
    end
end
