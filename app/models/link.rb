class Link < ActiveRecord::Base
  attr_accessible :url
  has_many :scores
  has_many :topics, :through => :scores
end
