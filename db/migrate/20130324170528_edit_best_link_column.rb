class EditBestLinkColumn < ActiveRecord::Migration
  def change
    change_column :topics, :best_link_id, :integer, :null => true, :default => nil
  end
end
