class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation

  validates_uniqueness_of :username

  has_many :votes
  has_many :topic_links, :through => :votes
  
end
