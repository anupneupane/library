class DropDescriptionFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :title
    remove_column :links, :description
  end
end
