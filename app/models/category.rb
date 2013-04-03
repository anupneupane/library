class Category < ActiveRecord::Base
  attr_accessible :title, :channel_id
  has_many :topics
  validates_presence_of :title

  #Both methods were originally added to interface with the app
  #in the terminal. They are never used in controller or view. 
  #Remove?
  #
  # def add_new_topic(title)
  #   self.topics.build(:title => title)
  #   self.save
  # end

  # def associate_topics(*topics)
  #   topics = topics.flatten
  #   topics.each do |t|
  #     topic = Topic.find(t) 
  #     self.topics << topic
  #   end
  #   self.save
  # end
end