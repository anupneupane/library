class AddDescriptionToTopicLinks < ActiveRecord::Migration
  def change
    add_column :topic_links, :title, :string
    add_column :topic_links, :description, :text
  end
end
