require File.dirname(__FILE__) + '/../spec_helper'

describe Budgetarea do
  it "should be valid" do
    Budgetarea.new.should be_valid
  end
end
