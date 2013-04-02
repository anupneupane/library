class TwitterAuth < ActiveRecord::Base
  attr_accessible :twitter_id, :twitter_handle, :token, :secret
  belongs_to :user

  def find_friends_on_twitter
    client = Grackle::Client.new(:auth=>{
      type: :oauth,
      consumer_key: TWITCONFIG['consumer_key'], consumer_secret: TWITCONFIG['consumer_secret'],
      token: self.token, token_secret: self.secret
    })
    client.friends.ids.json?.ids
  end

  def self.matching_twitter_auths(twitter_ids)
    TwitterAuth.includes(:user).where('twitter_id in (:twitter_ids)', twitter_ids: twitter_ids)
  end

  def find_and_save_friends
    twitter_friends = self.find_friends_on_twitter
    matches = TwitterAuth.matching_twitter_auths(twitter_friends)
    matches.each do |m|
      TwitterFriendship.first_or_create_friendship(self.user, m.user)
    end
  end

end
