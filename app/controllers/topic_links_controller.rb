class TopicLinksController < ApplicationController
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
    @topic.topic_links.build(params[:topic_link])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topic_links/1
  # PUT /topic_links/1.json
  def update
    @topic_link = TopicLink.find(params[:id])

    respond_to do |format|
      if @topic_link.update_attributes(params[:topic_link])
        format.html { redirect_to @topic_link, notice: 'TopicLink was successfully updated.' }
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

    respond_to do |format|
      format.html { redirect_to topic_links_url }
      format.json { head :no_content }
    end
  end
end
