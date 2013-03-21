class Vote < ActiveRecord::Base
  attr_accessible :topic_link_id, :user_id, :kind

  belongs_to :user
  belongs_to :topic_link

  def self.check_existing_vote(user_id, topic_link_id, kind)
    self.where(user_id: user_id, topic_link_id: topic_link_id, kind: kind).first
  end

end


