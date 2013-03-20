class RenameScoresToTopicLinks < ActiveRecord::Migration
  def change
    rename_table :scores, :topic_links
  end
end
