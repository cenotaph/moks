require File.dirname(__FILE__) + '/../spec_helper'

describe Projectproposal do
  it "should be valid" do
    Projectproposal.new.should be_valid
  end
end
