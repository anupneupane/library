class Link < ActiveRecord::Base
  attr_accessible :url, :title, :description
  validates_presence_of :url

  has_many :topic_links
  has_many :topics, :through => :topic_links

  def self.normalize_url(url)
    url = url.downcase
    if (url.include?("http://") || url.include?("https://"))
      url
    else
      url.insert(0,"http://")
    end
  end

end
