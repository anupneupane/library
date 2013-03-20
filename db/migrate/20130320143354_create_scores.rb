class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :link_id
      t.integer :topic_id
      t.integer :score, :default => 0

      t.timestamps
    end
  end
end
