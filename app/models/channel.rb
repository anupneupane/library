class Channel < ActiveRecord::Base
  attr_accessible :title
  has_many :categories, dependent: :destroy
end
