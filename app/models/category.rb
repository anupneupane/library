class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :topics


  def add_new_topic(title)
    self.topics.build(:title => title)
    self.save
  end

  def associate_topics(*topics)
    topics = topics.flatten
    topics.each do |t|
      topic = Topic.find(t) 
      self.topics << topic
    end
    self.save
  end
end