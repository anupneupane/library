class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :categories, :channel_id
    add_index :topic_links, :link_id
    add_index :topic_links, :score
    add_index :topic_links, :user_id
    add_index :topics, :user_id
    add_index :topics, :best_link_id
    add_index :twitter_friendships, :user_id
    add_index :twitter_friendships, :friend_id
    add_index :votes, :user_id
    add_index :votes, :topic_link_id
  end
end
