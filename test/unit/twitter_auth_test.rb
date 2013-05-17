# == Schema Information
#
# Table name: twitter_auths
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  twitter_id     :integer
#  twitter_handle :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  token          :string(255)
#  secret         :string(255)
#

require 'test_helper'

class TwitterAuthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
