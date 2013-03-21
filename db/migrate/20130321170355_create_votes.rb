class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :topic_link_id

      t.timestamps
    end
  end
end
