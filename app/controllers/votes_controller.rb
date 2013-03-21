class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])
    vote = @topic_link.votes.build(params[:vote])
    
    if vote.type == "up"
      @topic_link.score +=1
    elsif vote.type == "down"
      @topic_link.score -=1
    end

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
