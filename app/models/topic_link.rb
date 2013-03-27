class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description

  belongs_to :topic
  belongs_to :link
  belongs_to :user #owner

  has_many :votes
  has_many :voters, through: :votes, class_name: 'User', foreign_key: 'topic_link_id', source: :user

  validates_presence_of :title
  validates_presence_of :description


  def update_score_for(vote)
    self.upvote if vote.kind == "up"
    self.downvote if vote.kind == "down"
    self.save
    self.topic.best_link = self.topic.order_topic_links_by_score.first
  end

  def upvote
    self.score +=1
  end

  def downvote
    self.score -=1
  end



end
