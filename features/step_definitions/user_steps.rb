Given /^I am a curator$/ do
  @curator = Factory(:user, :curator => true)
end

Given /^I am a regular user$/ do
  @user = Factory(:user)
end


Given /^I log in as a (.*)$/ do |user_type|
  if user_type == "curator"
    visit login_path
    When %{I fill in "Login" with "#{@curator.login}"}
    When %{I fill in "Password" with "#{@curator.password}"}
    When %{I press "Log in"}
  else
    visit login_path
    When %{I fill in "Login" with "#{@user.login}"}
    When %{I fill in "Password" with "#{@user.password}"}
    When %{I press "Log in"}
  end
end

Given /^there are no users$/ do
  User.delete_all
end

Given /^I sign up as "([^\"]*)"$/ do |login|
  When %{I fill in "user_login" with "#{login}"}
  When %{I fill in "user_email" with "maloney.mc@gmail.com"}
  When %{I fill in "user_password" with "giraffe"}
  When %{I fill in "user_password_confirmation" with "giraffe"}
  When %{I press "Sign up"}
end

Then /^I should have ([0-9]*) user$/ do |count|
  User.count.should == count.to_i
end

Given /^I have already created a profile for "([^\"]*)"$/ do |login|
  @login_user = Factory(:user, :login => login)
end

When /^I enter my details$/ do
  When %{I fill in "Login" with "#{@login_user.login}"}
  When %{I fill in "Password" with "#{@login_user.password}"}
  When %{I press "Log in"}
end

Given /^I log in$/ do
  visit login_path
  When %{I fill in "Login" with "#{@login_user.login}"}
  When %{I fill in "Password" with "#{@login_user.password}"}
  When %{I press "Log in"}
end



