class Vote < ActiveRecord::Base
  attr_accessible :topic_link_id, :user_id, :status

  belongs_to :user
  belongs_to :topic_link

  validates_presence_of :user_id

  def self.find_prior_vote(user_id, topic_link_id)
    self.where(user_id: user_id, topic_link_id: topic_link_id).first
  end

  def update_vote(submitted_vote_status)
    self.status += submitted_vote_status
    self.save
  end

  def same_as_submitted_vote?(submitted_vote_status)
    self.status == submitted_vote_status
  end

  def vote_kind
    if self.status == 1
      "up"
    elsif self.status == -1
      "down"
    end
  end

end



