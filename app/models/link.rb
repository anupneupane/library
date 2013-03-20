class Link < ActiveRecord::Base
  attr_accessible :url
  has_many :topic_links
  has_many :topics, :through => :topic_links
end
