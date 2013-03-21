class User < ActiveRecord::Base
  attr_accessible :username

  has_many :votes
  has_many :topic_links, :through => :votes
  
end
