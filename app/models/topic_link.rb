class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :link_attributes

  belongs_to :topic
  belongs_to :link

  has_many :votes
  has_many :users, :through => :votes

  accepts_nested_attributes_for :link

  def up_vote(user_id)
    self.votes.build(user_id: user_id)
    self.save
  end


end
