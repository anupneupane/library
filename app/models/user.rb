class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_many :votes
  has_many :topic_links, :through => :votes

  has_secure_password
  
  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of :username
  validates_format_of :username, :with => /\A[A-Za-z0-9][A-Za-z0-9_-]*\Z/
  validates :username, :length => { :minimum => 3, :maximum => 15 }

  validates :password, :length => { :minimum => 4, :maximum => 20 }

  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  
end
