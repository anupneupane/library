class Score < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id

  belongs_to :topic
  belongs_to :link
end
