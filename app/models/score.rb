class Score < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id

  belongs_to :topic
  belongs_to :link

  def increase_score
    self.score += 1
  end

  def decrease_score
    self.score -= 1
  end

end
