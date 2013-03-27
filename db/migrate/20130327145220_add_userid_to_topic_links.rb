class AddUseridToTopicLinks < ActiveRecord::Migration
  def change
    add_column :topic_links, :user_id, :integer
  end
end
