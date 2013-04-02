class RenameTwitterFriendsToTwitterFriendships < ActiveRecord::Migration
  def change
    rename_table :twitter_friends, :twitter_friendships
  end
end
