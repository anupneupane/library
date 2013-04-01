class CreateTwitterFriends < ActiveRecord::Migration
  def change
    create_table :twitter_friends do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
