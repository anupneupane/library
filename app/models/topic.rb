class Topic < ActiveRecord::Base
  attr_accessible :title
  has_many :links

  def add_link(url)
    self.links.build(:url => url)
    self.save
  end

  def best_link=(link)
    if link.topic == self 
      self.best_link_id = link.id
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
