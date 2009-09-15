require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Question do
  describe "being created" do
    it "should be in the activated state" do
      question = Factory(:question)
      question.state.should == "pending"
    end
  end
  
  describe "showing" do
    it "should show the number of questions as a string" do
      Factory(:question, :state => "active")
      Question.num_of_questions.should == "1"
    end
  end
  
  describe "states" do
    it "should have an inactive state" do
      question = Factory(:question)
      question.deactivate
      question.state.should == "inactive"
    end
    
    it "should have an active state" do
      question = Factory(:question)
      question.activate
      question.state.should == "active"
    end
  end
end
