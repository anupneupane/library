class TwitterAuth < ActiveRecord::Base
  attr_accessible :twitter_id, :twitter_handle, :token, :secret
  belongs_to :user

  def fetch_twitter_friends
    client = Grackle::Client.new(:auth=>{
      type: :oauth,
      consumer_key: TWITCONFIG['consumer_key'], consumer_secret: TWITCONFIG['consumer_secret'],
      token: self.token, token_secret: self.secret
    })
    client.friends.ids.json?.ids
  end
end
