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

