Given /^the following questions exist:$/ do |table|
  table.hashes.each do |hash|
    Factory(:question, hash)
  end
end

Given /^there is a pending question "([^\"]*)"$/ do |body|
  Factory(:question, :body => body)
end

Given /^there is an active question "([^\"]*)"$/ do |body|
  Factory(:question, :body => body, :state => "active")
end

Then /^I should have ([0-9]*) (.*) question$/ do |count, type|
  case type
    when "inactive" then Question.with_state(:inactive).count.should == count.to_i
    when "active" then Question.with_state(:active).count.should == count.to_i
    when "pending" then Question.with_state(:pending).count.should == count.to_i
  end
end

Given /^I have no questions$/ do
  Question.delete_all
end

Given /^I add the question "([^\"]*)"$/ do |body|
  When %{I fill in "Body" with "#{body}"}
  When %{I press "Create"}
end

Then /^I should have ([0-9]*) question$/ do |count|
  Question.count.should == count.to_i
end

Given /^the following active questions exist:$/ do |table|
  table.hashes.each do |hash|
    Factory(:question, hash)
  end
end

Then /^that user should have ([0-9]*) questions$/ do |count|
  user = User.find_by_login("mcmaloney")
  user.questions.count.should == count.to_i
end

Given /^I add the following questions :$/ do |table|
  table.hashes.each do |hash|
    Factory(:question, hash)
  end
end

When /^I create a question "([^\"]*)"$/ do |body|
  Factory(:question, :body => body, :state => "active")
end

