class Topic < ActiveRecord::Base
  attr_accessible :title, :category_id

  belongs_to :category

  has_many :topic_links
  has_many :links, :through => :topic_links

  def add_new_link(url)
    self.links.build(:url => url)
    self.save
  end

  def associate_links(*links)
    links = links.flatten
    links.each do |l| 
      self.links << l
    end
    self.save
  end

  def best_link=(topic_link_instance)
    if topic_link_instance.topic == self
      self.best_link_id = topic_link_instance.link.id
      self.save
    else
      raise "This link doesn't belong to this topic"
    end
  end

  def best_link
      Link.find(self.best_link_id) unless self.best_link_id == nil
  end

  def includes_link?(link)
    true if (self.topic_links.where(:link_id => link.id).first) || false
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

  # def remove_link(url)
  #   l = self.links.find_by_url(url)
  #   l.destroy
  # end

end
