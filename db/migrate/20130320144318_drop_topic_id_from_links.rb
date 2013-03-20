class DropTopicIdFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :topic_id  
  end

end
