# require 'public_suffix'

class Link < ActiveRecord::Base
  attr_accessible :url, :title, :description
  # validates :url, :presence => true, :url => true

  include PublicSuffix
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

  def self.check_suffix(url)
    uri = URI.parse(url)
    begin
      domain = PublicSuffix.parse(uri.host)
      true
    rescue PublicSuffix::DomainInvalid
      false
    end
  end
end
