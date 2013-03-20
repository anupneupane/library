class Topic < ActiveRecord::Base
  attr_accessible :title, :category
  has_many :topic_links
  has_many :links, :through => :topic_links
  belongs_to :category

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

  def best_link=(link_instance)
    if link_instance.topic == self 
      self.best_link_id = link_instance.id
      self.save
    else
      raise "This link doesn't belong to this topic"
    end
  end

  def best_link
    Link.find(self.best_link_id)
  end


  # def remove_link(url)
  #   l = self.links.find_by_url(url)
  #   l.destroy
  # end

end
