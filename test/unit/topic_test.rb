# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  best_link_id :integer
#  category_id  :integer
#  user_id      :integer
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
