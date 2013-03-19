class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :topics

  def associate_topics(*topic_ids)
    topic_ids.each do |t|
      topic_instance = Topic.find(t)
      topic_instance.category_id=self.id 
      topic_instance.save
    end
  end

  def add_new_topic(title)
    self.topics.build(:title => title)
    self.save
  end
end
