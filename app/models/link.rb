class Link < ActiveRecord::Base
  attr_accessible :url, :title, :description
  validates_presence_of :url

  has_many :topic_links
  has_many :topics, :through => :topic_links

  def self.normalize_url(url)
    url.downcase.insert(0,"http://") unless url.include?("http://")
  end

end
