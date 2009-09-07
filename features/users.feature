Feature: Users
  As a person who has any interest in answering these many questions
  I want to log in to my account
  So that I can continue answering questions and saving my previous responses
  
  Scenario: User creates account
    Given there are no users
    And I am on the home page 
    And I follow "Sign Up"
    And I sign up as "mcmaloney"
    Then I should see "Welcome to BinaryMe, mcmaloney."
    And I should have 1 user
  
  Scenario: Existing user logs in
    Given I have already created a profile for "mcmaloney"
    And I am on the home page
    When I follow "Log in"
    And I enter my details
    Then I should see "Logged in as mcmaloney"
    And I should see "Log Out"
    And I should not see "Log in"
  
  Scenario: Existing user edits account details
    Given I have already created a profile for "mcmaloney"
    And I log in
    And I am on the home page
    And I follow "Edit my Profile"
    When I fill in "First Name" with "Michael"
    And I fill in "Last Name" with "Maloney"
    And I press "Save"
    Then I should see "Changes saved."