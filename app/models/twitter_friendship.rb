class TwitterFriendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :user_id, :scope => :friend_id


  def self.first_or_create_friendship(user, friend)
    user = user.id if (! user.is_a? Fixnum)
    friend = friend.id if (! friend.is_a? Fixnum)
    TwitterFriendship.where(user_id: user, friend_id: friend).first_or_create
  end
end