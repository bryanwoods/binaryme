Given /^the following questions exist:$/ do |table|
  table.hashes.each do |hash|
    Factory(:question, hash)
  end
end

Given /^there is a pending question "([^\"]*)"$/ do |body|
  Factory(:question, :body => body)
end

Then /^I should have ([0-9]*) active question$/ do |count|
  Question.with_state(:active).count.should == count.to_i
end
