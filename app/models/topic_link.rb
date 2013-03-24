class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description

  belongs_to :topic
  belongs_to :link

  has_many :votes
  has_many :users, :through => :votes

  def update_score_for(vote)
    self.upvote if vote.kind == "up"
    self.downvote if vote.kind == "down"
    self.topic.best_link = self.topic.order_topic_links_by_score.first
  end

  def upvote
    self.score +=1
  end

  def downvote
    self.score -=1
  end



end
