class Channel < ActiveRecord::Base
  attr_accessible :title
  has_many :categories
end
