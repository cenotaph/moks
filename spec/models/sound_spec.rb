require File.dirname(__FILE__) + '/../spec_helper'

describe Sound do
  it "should be valid" do
    Sound.new.should be_valid
  end
end
