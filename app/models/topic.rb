class Topic < ActiveRecord::Base
  attr_accessible :title, :category_id, :user_id

  belongs_to :category
  belongs_to :user

  has_many :topic_links
  has_many :links, :through => :topic_links
  belongs_to :best_link, class_name: 'TopicLink'

  validates_presence_of :title

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && has_no_topic_links?))
  end

  def has_best_link?
    self.best_link != nil && self.best_link.score > 0
  end

  def has_no_topic_links?
    self.links.length == 0
  end

  def includes_link?(link)
    true if (self.topic_links.where(:link_id => link.id).first) || false
  end

  def order_topic_links_by_score
    self.topic_links.all(:order => "score desc, updated_at desc")
  end

end
