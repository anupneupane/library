class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation

  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_presence_of :email

  has_many :votes
  has_many :topic_links, :through => :votes
  
end
