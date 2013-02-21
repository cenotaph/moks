require File.dirname(__FILE__) + '/../spec_helper'

describe Projecttype do
  it "should be valid" do
    Projecttype.new.should be_valid
  end
end
