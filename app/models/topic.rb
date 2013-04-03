class Topic < ActiveRecord::Base
  attr_accessible :title, :category_id, :user_id

  belongs_to :category
  belongs_to :user

  has_many :topic_links, dependent: :destroy
  has_many :links, through: :topic_links
  has_one :best_link, class_name: TopicLink

  validates_presence_of :title

  def has_best_link?
    self.best_link != nil && self.best_link.score > 0
  end

  def authorize?(user)
    user && (user.admin? || (self.user_id==user.id && has_no_topic_links?))
  end

  def add_new_link(url)
    self.links.build(:url => url)
    self.save
  end

  def has_no_topic_links?
    self.links.length == 0
  end

  def associate_links(*links)
    links = links.flatten
    links.each do |l|
      self.links << l
    end
    self.save
  end

  def includes_link?(link)
    true if self.topic_links.find_by_link_id(link.id) || false
  end

  def reject_or_associate(link)
    if self.includes_link?(link)
      raise link.inspect
      return 0
    else #if it is not, make the association
      self.topic_links.build(:link => link)
      return 10
    end

  end

  def order_topic_links_by_score
    self.topic_links.order(:score).reverse
  end

end
