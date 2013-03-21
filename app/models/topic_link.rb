class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :link_attributes

  belongs_to :topic
  belongs_to :link

  has_many :votes
  has_many :users, :through => :votes

  accepts_nested_attributes_for :link

  def cast_vote(params)
    v = self.votes.build(params)
    v.save
    return v
  end

  def score_vote_kind(vote)
    self.upvote if vote.kind == "up"
    self.downvote if vote.kind == "down"
  end

  def upvote
    self.score +=1
  end

  def downvote
    self.score -=1
  end



end
