class TwitterAuth < ActiveRecord::Base
  attr_accessible :twitter_id, :twitter_handle, :token, :secret, :user_id
  belongs_to :user

  def find_friends_on_twitter
    self.twitter_request.friends.ids.json?.ids
  end

  def matching_auths_with_user_id(twitter_ids)
    stringified_ids = twitter_ids.join(', ')
    TwitterAuth.find_by_sql("SELECT users.id AS user_id, twitter_auths.token, twitter_auths.secret FROM twitter_auths INNER JOIN users ON twitter_auths.user_id=users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_id NOT IN (SELECT twitter_id FROM twitter_friendships INNER JOIN users ON twitter_friendships.friend_id = users.id INNER JOIN twitter_auths ON twitter_auths.user_id = users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_friendships.user_id IN (#{self.user_id}));")

    # TwitterAuth.joins(:user).where(:twitter_id => twitter_ids).pluck(:twitter_id)
    # User.joins('INNER JOIN twitter_friendships ON twitter_friendships.friend_id = users.id').joins(:twitter_auth).where('twitter_id IN (:twitter_ids) AND twitter_friendships.user_id IS :user_id', twitter_ids: twitter_ids, user_id:'5').pluck(:twitter_id)
  end

  def find_and_save_friends
    if self.authenticated?
      twitter_friends = self.find_friends_on_twitter
      matches = self.matching_auths_with_user_id(twitter_friends)
      matches.each do |friend|
        (TwitterFriendship.create(user_id: self.user_id, friend_id: friend.user_id) if friend.authenticated?) || friend.destroy
      end
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
    self.user.twitter_friendships.destroy_all
    self.destroy
  end

  def authenticated?
    begin
      self.twitter_request.account.verify_credentials?
      true
    rescue
      false
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
