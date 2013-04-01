class RemoveKindFromVote < ActiveRecord::Migration
  def up
    remove_column :votes, :kind
  end

  def down
    add_column :votes, :kind, :string
  end
end
