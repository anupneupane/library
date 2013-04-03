class VotesController < ApplicationController
  def create
    submitted_vote_status = params[:vote][:status].to_i
    @topic = Topic.find(params[:topic_id])
    @topic_link = TopicLink.find(params[:link_id])
    @prior_vote = Vote.find_prior_vote(params[:vote][:user_id], params[:link_id])
    
    if @prior_vote && @prior_vote.same_as_submitted_vote?(submitted_vote_status)
      notice = "You have already #{@prior_vote.vote_kind} voted on this link." 
    else
      if @prior_vote == nil 
        @topic_link.update_score(submitted_vote_status)
        @topic_link.votes.build(params[:vote]).save
      else
        @topic_link.update_score(submitted_vote_status)
        @prior_vote.update_vote(submitted_vote_status)
      end
      notice = "Vote successful."      
    end
    # binding.pry
    @topic.best_link = @topic.order_topic_links_by_score.first
    @topic.save
    respond_to do |format|
      format.html { redirect_to @topic, notice: notice}
      format.json { render json: @topic, status: :created, location: @topic }
    end
  end
end