class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])

    if ! Vote.where(user_id: params[:vote][:user_id], topic_link_id: @topic_link.id, kind: params[:vote][:kind] ).first

      @vote = @topic_link.cast_vote(params[:vote])
      @topic_link.score_vote_kind(@vote)

    else
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
