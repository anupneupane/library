class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :link_attributes

  belongs_to :topic
  belongs_to :link


  accepts_nested_attributes_for :link
end
