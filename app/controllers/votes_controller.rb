class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])
    @topic_link.increase_score
 

    respond_to do |format|
      if @topic_link.save
        format.html { redirect_to @topic, notice: 'Upvote Successful.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end
end
