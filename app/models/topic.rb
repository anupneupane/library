class Topic < ActiveRecord::Base
  attr_accessible :title, :category_id, :user_id

  belongs_to :category
  belongs_to :user

  has_many :topic_links, dependent: :destroy
  has_many :links, :through => :topic_links
  belongs_to :best_link, class_name: 'TopicLink'

  validates_presence_of :title

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && has_no_topic_links?))
  end

  def has_no_topic_links?
    self.links.length == 0
  end

  def includes_link?(link)
    true if self.topic_links.find_by_link_id(link.id) || false
  end

  def order_topic_links_by_score
    self.topic_links.order("score desc, updated_at desc")
  end

  def best_link
    if ! self.has_no_topic_links?
      self.order_topic_links_by_score.first if self.order_topic_links_by_score.first.score > 0
    end
  end

end
