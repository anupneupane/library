class Category < ActiveRecord::Base
  attr_accessible :title, :channel_id
  has_many :topics, :dependent => :destroy
  belongs_to :channel
  validates_presence_of :title

end
