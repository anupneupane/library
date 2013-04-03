require 'open-uri'

class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description, :link_attributes, :user_id
  
  belongs_to :topic
  belongs_to :link
  accepts_nested_attributes_for :link

  belongs_to :user #owner

  has_many :votes
  has_many :voters, through: :votes, class_name: 'User', foreign_key: 'topic_link_id', source: :user

  validates_presence_of :title
  validates_presence_of :description

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && is_score_zero?))
  end

  def is_score_zero?
    self.score == 0
  end

  def update_score(vote)
    self.score += vote
    self.save
  end

  def has_no_prior_vote?(prior_vote)
    prior_vote.nil?
  end

  def cast_vote(prior_vote_instance, submit_params, submit_status)
    self.update_score(submit_status)
    if self.has_no_prior_vote?(prior_vote_instance)
      self.votes.build(submit_params).save
    else
      prior_vote_instance.update_vote(submit_status)
    end
  end

  def scrape(url)
    web_address = open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
    page = Nokogiri::HTML(web_address)
    self.title = page.css("title").text
  end

end
