class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :link_attributes

  belongs_to :topic
  belongs_to :link

  has_many :votes
  has_many :users, :through => :votes

  accepts_nested_attributes_for :link

  def cast_vote(params)
    self.votes.build(params)
  end

  def score_vote_type(vote)
    self.upvote if vote.type == "up"
    self.downvote if vote.type == "down"
  end

  def upvote
    self.score +=1
  end

  def downvote
    self.score -=1
  end



end
