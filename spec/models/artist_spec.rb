require File.dirname(__FILE__) + '/../spec_helper'

describe Artist do
  it "should be valid" do
    Artist.new.should be_valid
  end
end
