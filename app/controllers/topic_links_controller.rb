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
  end

  # POST /topic_links
  # POST /topic_links.json
  def create
    @topic = Topic.find(params[:topic_id])
    url = Link.normalize_url(params[:link][:url])
    @link = Link.find_by_url(url) 
    @tl = @topic.topic_links.build(params[:topic_link])
    @tl.user = current_user
    
    if url == "http://"
      notice = "URL field may not be blank."
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
    number_of_associations = TopicLink.where(:link_id => params[:topic_link][:link_attributes][:id]).length
    @existing_topic_link = TopicLink.find(params[:id])
    submitted_link_url = params[:topic_link][:link_attributes][:url]
    @existing_link_url = Link.find_by_url(submitted_link_url)
    if number_of_associations == 1
      @existing_topic_link.update_attributes(:title => params[:topic_link][:title], :description => params[:topic_link][:description])
      if @existing_link_url
        @existing_topic_link.link_id = Link.find_by_url(submitted_link_url)
      else
        @existing_link.update_attributes(:url => params[:topic_link][:link_attributes][:url])
      end
    end
    # elsif number_of_associations > 1


    
    # @current_link_topic_links = @current_link.topic_links


# # this line below was deleted
#     @topic_link = TopicLink.find(params[:id])

# # just added all this code for redundant links
#     @input_url_link = Link.find_by_url(params[:topic_link][:link_attributes][:url]).first
#     @matching_topic_links = @input_url_link.topic_links

# if input url is nil (input url does not yet exist in database)
#   if current link topic links . length == 1 (current/old url has no other associations)
#     change current link url to input url
#   elsif length > 1 (current/old url has other associations)
#     create new link with input url and associate with current topic link
#   elsif input url exists in database (returns an instance)
#     associate this link instance with current topic_link
# if current (old) link has no other associations
#   delete it
# else
#   don't delete it
# end

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

    def tl_admin_or_creator
      redirect_to root_path, notice: "You are not authorized to do that!" if (! @topic_link.authorize?(current_user))
    end

end
