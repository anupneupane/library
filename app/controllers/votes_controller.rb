class VotesController < ApplicationController
  def create
    submitted_vote_status = params[:vote][:status].to_i
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])
    @prior_vote = Vote.find_prior_vote(params[:vote][:user_id], params[:link_id])

    if @prior_vote and @prior_vote.same_as_submitted_vote?(submitted_vote_status)
      respond_to do |format|
        format.html { redirect_to @topic, notice: "You have already #{@prior_vote.vote_kind} voted on this link." }
        format.json { render json: @topic, status: :created, location: @topic }
      end 
    else
      if @prior_vote == nil
        @topic_link.update_score(submitted_vote_status)
        @prior_vote = @topic_link.votes.build(params[:vote])
        @prior_vote.save
      else
        @topic_link.update_score(submitted_vote_status)
        @prior_vote.update_vote(submitted_vote_status)
      end
      respond_to do |format|
        format.html { redirect_to @topic, notice: "Vote successful." }
        format.json { render json: @topic, status: :created, location: @topic }      
      end
    end  
  end
end