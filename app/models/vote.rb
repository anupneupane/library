class Vote < ActiveRecord::Base
  attr_accessible :topic_link_id, :user_id, :kind

  belongs_to :user
  belongs_to :topic_link

  validates_presence_of :user_id

  def same_as_last_vote?
    last_vote = Vote.where(user_id: user_id, topic_link_id: topic_link_id).order("created_at").last
    if last_vote
      true if (last_vote.kind == self.kind) || false
    else
      false
    end
  end

end


