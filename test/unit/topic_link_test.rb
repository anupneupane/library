# == Schema Information
#
# Table name: topic_links
#
#  id          :integer          not null, primary key
#  link_id     :integer
#  topic_id    :integer
#  score       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  description :text
#  user_id     :integer
#

require 'test_helper'

class TopicLinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
