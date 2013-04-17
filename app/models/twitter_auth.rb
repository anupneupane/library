class TwitterAuth < ActiveRecord::Base
  attr_accessible :twitter_id, :twitter_handle, :token, :secret, :user_id
  belongs_to :user
  validates_presence_of :twitter_handle
  
  @@rate_limit_exceeded = false

  def self.rate_limit_exceeded=(value)
    @@rate_limit_exceeded = value
  end

  def self.rate_limit_exceeded
    @@rate_limit_exceeded
  end

  def find_friends_on_twitter
    self.twitter_request.friends.ids.json?.ids
  end

  def find_followers_on_twitter
    self.twitter_request.followers.ids.json?.ids
  end

  def collect_authenticated_friends(twitter_ids)
    stringified_ids = twitter_ids.join(', ')
    TwitterAuth.find_by_sql("SELECT users.id AS user_id, twitter_auths.token, twitter_auths.secret FROM twitter_auths INNER JOIN users ON twitter_auths.user_id=users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_id NOT IN (SELECT twitter_id FROM twitter_friendships INNER JOIN users ON twitter_friendships.friend_id = users.id INNER JOIN twitter_auths ON twitter_auths.user_id = users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_friendships.user_id IN (#{self.user_id}));")

    # TwitterAuth.joins(:user).where(:twitter_id => twitter_ids).pluck(:twitter_id)
    # User.joins('INNER JOIN twitter_friendships ON twitter_friendships.friend_id = users.id').joins(:twitter_auth).where('twitter_id IN (:twitter_ids) AND twitter_friendships.user_id IS :user_id', twitter_ids: twitter_ids, user_id:'5').pluck(:twitter_id)
  end


  def collect_authenticated_followers(twitter_ids)
    stringified_ids = twitter_ids.join(', ')
    TwitterAuth.find_by_sql("SELECT users.id AS user_id, twitter_auths.token, twitter_auths.secret FROM twitter_auths INNER JOIN users ON twitter_auths.user_id=users.id WHERE twitter_id IN (#{stringified_ids});")

    # TwitterAuth.joins(:user).where(:twitter_id => twitter_ids).pluck(:twitter_id)
    # User.joins('INNER JOIN twitter_friendships ON twitter_friendships.friend_id = users.id').joins(:twitter_auth).where('twitter_id IN (:twitter_ids) AND twitter_friendships.user_id IS :user_id', twitter_ids: twitter_ids, user_id:'5').pluck(:twitter_id)
  end


  def find_and_save_friends
    if self.authenticated?
      twitter_friends = self.find_friends_on_twitter
      friend_matches = self.collect_authenticated_friends(twitter_friends)
      friend_matches.each do |friend|
        (TwitterFriendship.create(user_id: self.user_id, friend_id: friend.user_id) if friend.authenticated?) || friend.destroy
      end
    else
      self.unauthenticate
    end
  end

  def find_and_save_followers
    twitter_followers = self.find_followers_on_twitter
    follower_matches = self.collect_authenticated_followers(twitter_followers)
    follower_matches.each do |follower|
      (TwitterFriendship.create(user_id: follower.user_id, friend_id: self.user_id) if follower.authenticated?) || follower.destroy
    end
  end

  def self.delete_all_unauthenticated
    self.all.each do |ta|
      ta.unauthenticate unless ta.authenticated?
    end
  end

  def self.update_all_friendships
    self.all.each do |ta|
      ta.find_and_save_friends
    end
  end

  def unauthenticate
    self.user.remove_friendships
    self.destroy
  end

  def authenticated?
    begin
      self.twitter_request.account.verify_credentials?
      true
    rescue Grackle::TwitterError => e
     if e.status == 429
      TwitterAuth.rate_limit_exceeded = true
      true
     else
      false
     end

    end
  end
  def twitter_request
    Grackle::Client.new(:auth=>{
      type: :oauth,
      consumer_key: 'uBbQMkAZI1eRI7kJSzBzA', consumer_secret: '7Ol8c6U5CrYdqqDqOTKxOyDA9XDoGE8Fn4248zoOD4',
      token: self.token, token_secret: self.secret
    })
  end
end
