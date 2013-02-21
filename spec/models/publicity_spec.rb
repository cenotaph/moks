require File.dirname(__FILE__) + '/../spec_helper'

describe Publicity do
  it "should be valid" do
    Publicity.new.should be_valid
  end
end
