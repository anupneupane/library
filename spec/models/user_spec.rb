require 'spec_helper'

describe User do
  it "can be set as admin" do
    rahul = FactoryGirl.create(:user)
    rahul.set_as_admin
    rahul.role.should == 10
  end
end