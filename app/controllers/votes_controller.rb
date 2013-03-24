class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])
    @vote = @topic_link.votes.build(params[:vote])

    if ! @vote.same_as_last_vote?

      @topic_link.update_score_for(@vote)

      respond_to do |format|
        if @topic_link.save
          format.html { redirect_to @topic, notice: "#{@vote.kind.capitalize}vote successful." }
          format.json { render json: @topic, status: :created, location: @topic }
        else
          format.html { render action: "new" }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to @topic, notice: "You have already #{params[:vote][:kind]}voted this link." }
        format.json { render json: @topic, status: :created, location: @topic }
      end
    end
  end
end
