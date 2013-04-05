class TwitterAuth < ActiveRecord::Base
  attr_accessible :twitter_id, :twitter_handle, :token, :secret, :user_id
  belongs_to :user

  def find_friends_on_twitter
    client = Grackle::Client.new(:auth=>{
      type: :oauth,
      consumer_key: 'uBbQMkAZI1eRI7kJSzBzA', consumer_secret: '7Ol8c6U5CrYdqqDqOTKxOyDA9XDoGE8Fn4248zoOD4',
      token: self.token, token_secret: self.secret
    })
    #binding.pry
    client.friends.ids.json?.ids
  end

  def matching_twitter_auths(twitter_ids)
    # binding.pry
    stringified_ids = twitter_ids.join(', ')
    TwitterAuth.find_by_sql("SELECT users.id FROM twitter_auths INNER JOIN users ON twitter_auths.user_id=users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_id NOT IN (SELECT twitter_id FROM twitter_friendships INNER JOIN users ON twitter_friendships.friend_id = users.id INNER JOIN twitter_auths ON twitter_auths.user_id = users.id WHERE twitter_id IN (#{stringified_ids}) AND twitter_friendships.user_id IS #{self.user_id});")

    # TwitterAuth.joins(:user).where(:twitter_id => twitter_ids).pluck(:twitter_id)
    # User.joins('INNER JOIN twitter_friendships ON twitter_friendships.friend_id = users.id').joins(:twitter_auth).where('twitter_id IN (:twitter_ids) AND twitter_friendships.user_id IS :user_id', twitter_ids: twitter_ids, user_id:'5').pluck(:twitter_id)
  end

  def self.extract_user_ids(twitter_auth_instances)
    twitter_auth_instances.collect{|i| i.id}
  end

  def find_and_save_friends
    twitter_friends = self.find_friends_on_twitter
    matches = self.matching_twitter_auths(twitter_friends)
    new_friend_ids = TwitterAuth.extract_user_ids(matches)
    new_friend_ids.each do |friend_id|
      TwitterFriendship.create(user_id: self.user_id, friend_id: friend_id)
    end
  end

  def self.form_all_new_friendships
    self.all.each do |ta|
      ta.find_and_save_friends
    end
  end

end
