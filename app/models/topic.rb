class Topic < ActiveRecord::Base
  attr_accessible :title
  has_many :links

  def add_link(url)
    self.links.build(:url => url)
    self.save
  end

  def best_link(link)
    if link
      self.best_link_id = link_id
    end
  end

  # def remove_link(url)
  #   l = self.links.find_by_url(url)
  #   l.destroy
  # end

end
