class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :role

  has_one :twitter_auth, dependent: :destroy
  has_many :twitter_friendships, dependent: :destroy
  has_many :friends, through: :twitter_friendships, source: :friend
  has_many :votes
  has_many :voted_topic_links, through: :votes, class_name: 'TopicLink', foreign_key: 'user_id', source: :topic_link
  has_many :topics
  has_many :topic_links #topic links created by user
  has_secure_password
  
  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of :username
  validates_format_of :username, :with => /\A[A-Za-z0-9][A-Za-z0-9_-]*\Z/
  validates :username, :length => { :minimum => 3, :maximum => 15 }
  validates :password, :length => { :minimum => 4, :maximum => 20 }
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  USER_ROLES = {
    :basic => 0,
    :admin => 10
  }

  def self.user_roles
    USER_ROLES
  end

  def role_name
    User.user_roles.key(self.role)
  end

  def set_as_admin 
    self.role = USER_ROLES[:admin]
  end

  def set_as_basic 
    self.role = USER_ROLES[:basic]
  end

  def admin?
    self.role_name == :admin
  end

  def authorize?(current_user)
    current_user && current_user.admin? || self.id == current_user.id
  end

  def authenticated_with_twitter?
    !! self.twitter_auth
  end

  def link_twitter(auth_hash)
    @twit_auth = TwitterAuth.find_or_initialize_by_user_id(self.id)
    @twit_auth.update_attributes(
      twitter_id: auth_hash['uid'],
      twitter_handle: auth_hash['info']['nickname'],
      token: auth_hash['credentials']['token'],
      secret: auth_hash['credentials']['secret']
    )
    @twit_auth.save
    #@twit_auth.find_and_save_friends
  end

  def twitter_id
    (self.twitter_auth.twitter_id if self.authenticated_with_twitter?) || nil
  end

  def twitter_handle
    (self.twitter_auth.twitter_handle if self.authenticated_with_twitter?) || nil
  end

  def self.find_by_twitter_id(id)
    User.joins(:twitter_auth).where("twitter_auths.twitter_id = :id", id: id).first || nil
  end

  def up_votes
    self.votes.select{ |v| v.status == 1}.collect{|v| v.topic_link}
  end

  def down_votes
    self.votes.select{ |v| v.status == -1}.collect{|v| v.topic_link}
  end

end
