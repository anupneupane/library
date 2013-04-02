class CreateTwitterAuths < ActiveRecord::Migration
  def change
    create_table :twitter_auths do |t|
      t.integer :user_id
      t.integer :twitter_id
      t.string  :twitter_handle

      t.timestamps
    end
  end
end
