class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :role

  has_many :votes
  has_many :topic_links, :through => :votes
  has_many :topics

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

  ###This method
  def creator?(item)
    self.id == item.user_id
  end

  def admin_or_creator?(item)
    self.admin? || self.creator?(item)
  end

  def can_create_edit_or_destroy?(topic)
    true if (self.admin? unless self == nil) || self.id == topic.user_id
  end

  
  def can_edit_or_destroy?
    true if self.admin? unless self == nil 
  end


end
