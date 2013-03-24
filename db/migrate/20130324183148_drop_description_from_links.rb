class DropDescriptionFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :title, :string
    remove_column :links, :description, :text
  end
end
