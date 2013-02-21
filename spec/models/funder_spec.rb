require File.dirname(__FILE__) + '/../spec_helper'

describe Funder do
  it "should be valid" do
    Funder.new.should be_valid
  end
end
