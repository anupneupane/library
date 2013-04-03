class AddChannelIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :channel_id, :integer
  end
end
