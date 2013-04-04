  # require 'public_suffix'

class Link < ActiveRecord::Base
  attr_accessible :url, :title, :description
  # validates :url, :presence => true, :url => true

  include PublicSuffix
  has_many :topic_links
  has_many :topics, :through => :topic_links

  def prepend_http
    self.url.insert(0,"http://") if ! self.url.start_with?("http://" ,"https://")
  end

  def is_valid?
    self.prepend_http 
    begin
      uri = URI.parse(self.url)
      PublicSuffix.parse(uri.host)
      true
    rescue
      false
    end
  end

end
  