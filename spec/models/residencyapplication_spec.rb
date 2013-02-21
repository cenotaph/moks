require File.dirname(__FILE__) + '/../spec_helper'

describe Residencyapplication do
  it "should be valid" do
    Residencyapplication.new.should be_valid
  end
end
