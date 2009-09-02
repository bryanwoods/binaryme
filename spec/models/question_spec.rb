require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Question do
  describe "being created" do
    it "should be in the activated state" do
      question = Factory(:question)
      question.state.should == "active"
    end
  end
  
  describe "inactivating" do
    it "should have an inactive state" do
      question = Factory(:question)
      question.deactivate
      question.state.should == "inactive"
    end
  end
end
