class Link < ActiveRecord::Base
  attr_accessible :url, :title, :description

  has_many :topic_links
  has_many :topics, :through => :topic_links

  def normalize_link(url)
    url.downcase.insert(0,"http://") unless url.include?("http://")
  end

end
