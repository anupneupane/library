require 'open-uri'

class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description, :link_attributes, :user_id
  
  belongs_to :topic
  belongs_to :link
  accepts_nested_attributes_for :link

  belongs_to :user #owner

  has_many :votes
  has_many :voters, through: :votes, class_name: 'User', foreign_key: 'topic_link_id', source: :user

  validates_presence_of :title, :description

  def is_score_zero?
    self.score == 0
  end

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && is_score_zero?))
  end

  # just added for checking redundant links
  def includes_link?(link)
    true if (self.topic_links.where(:link_id => link.id).first) || false
  end

  def update_score(vote)
    self.score += vote
    self.save
    self.topic.best_link = self.topic.order_topic_links_by_score.first
  end

  def scrape(url)
    web_address = open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
    page = Nokogiri::HTML(web_address)
    self.title = page.css("title").text
  end

  def create_associate_or_reject_link
    existing_link = Link.find_by_url(self.link.url)
    if existing_link && self.topic.includes_link?(existing_link) #link exists and already belongs to this topic
      
      false #don't save it
    else
      self.link = existing_link if existing_link #link exists but does not belong to this topic
      self.save #link is completely new, just save it
    end
  end

end
