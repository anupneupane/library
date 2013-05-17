# == Schema Information
#
# Table name: topic_links
#
#  id          :integer          not null, primary key
#  link_id     :integer
#  topic_id    :integer
#  score       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  description :text
#  user_id     :integer
#

require 'open-uri'

class TopicLink < ActiveRecord::Base
  attr_accessible :link_id, :score, :topic_id, :title, :description, :link_attributes, :user_id

  belongs_to :topic
  belongs_to :link
  accepts_nested_attributes_for :link

  belongs_to :user #owner

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, class_name: 'User', foreign_key: 'topic_link_id', source: :user

  validates_presence_of :title

  default_scope order('topic_links.score DESC, topic_links.updated_at DESC')

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

  def create_associate_or_reject_link
    existing_link = Link.find_by_url(self.link.url)
    if existing_link && self.topic.includes_link?(existing_link) #link exists and already belongs to this topic
      false #don't save it
    else
      self.link = existing_link if existing_link #link exists but does not belong to this topic
      self.save #link is completely new, just save it
    end
  end

  def friend_up_voters(current_user)
    @friends ||= current_user.collect_friend_ids
    @friend_up_voters ||= self.votes.includes(:user).where(status: 1, user_id: @friends)
  end

  def friends_score(current_user)
    self.friend_up_voters(current_user).size
  end

end
