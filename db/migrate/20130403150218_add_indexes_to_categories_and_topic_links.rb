class AddIndexesToCategoriesAndTopicLinks < ActiveRecord::Migration
  def change
    add_index :topics, :category_id
    add_index :topic_links, :topic_id
  end
end
