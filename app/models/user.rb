class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation

  validates_uniqueness_of :username
  validates_presence_of :username
  validates :username, :length => { :minimum => 3, :maximum => 15 }

  validates :password, :length => { :minimum => 4, :maximum => 20 }

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/


  has_many :votes
  has_many :topic_links, :through => :votes
  
end
