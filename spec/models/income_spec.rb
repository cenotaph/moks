require File.dirname(__FILE__) + '/../spec_helper'

describe Income do
  it "should be valid" do
    Income.new.should be_valid
  end
end
