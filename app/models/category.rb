# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :integer
#

class Category < ActiveRecord::Base
  attr_accessible :title, :channel_id
  has_many :topics, :dependent => :destroy
  belongs_to :channel
  validates_presence_of :title

end
