require File.dirname(__FILE__) + '/../spec_helper'

describe Registration do
  it "should be valid" do
    Registration.new.should be_valid
  end
end
