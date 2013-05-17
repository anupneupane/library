# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  email           :string(255)
#  role            :integer
#

require 'spec_helper'

describe User do
  it "can be set as admin" do
    rahul = FactoryGirl.create(:user)
    rahul.set_as_admin
    rahul.role.should == 10
  end
end
