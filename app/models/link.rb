class Link < ActiveRecord::Base
  attr_accessible :url, :topic_id
  belongs_to :topic
end
