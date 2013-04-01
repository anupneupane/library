class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description, :link_attributes, :user_id
  
  belongs_to :topic
  belongs_to :link
  accepts_nested_attributes_for :link

  belongs_to :user #owner

  has_many :votes
  has_many :voters, through: :votes, class_name: 'User', foreign_key: 'topic_link_id', source: :user

  validates_presence_of :title
  validates_presence_of :description

  def is_score_zero?
    self.score == 0
  end

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && is_score_zero?))
  end

  # just added for checking redundant links
  def includes_link?(link)
    true if (self.topic_links.where(:link_id => link.id).first) || false
  end

  def update_score(vote)
    self.score += vote
    self.save
    self.topic.best_link = self.topic.order_topic_links_by_score.first
  end

end
