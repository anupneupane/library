class AddBestLinkToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :best_link_id, :integer
  end
end
