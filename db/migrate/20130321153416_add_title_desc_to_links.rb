class AddTitleDescToLinks < ActiveRecord::Migration
  def change
    add_column :links, :title, :string
    add_column :links, :description, :text
  end
end
