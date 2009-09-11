Feature: Questions
  As a user
  I want to have a list of questions that is updated as they are added by curators
  So that I can answer all the activated questions
  And I want my number to be as long (in digits) as the number of active questions
  So that I can see my number and do cool stuff with it
  
  Scenario: User gets existing questions when he signs up
    Given the following active questions exist:
      | body              | state  |
      | I am a man        | active |
      | I have green eyes | active |
    And there are no users
    And I am on the home page
    When I follow "Sign Up"
    And I sign up as "mcmaloney"
    Then I should have 1 user
    And that user should have 2 questions
  
  Scenario: User's question array is appended when he logs in
    Given the following active questions exist:
      | body              | state  |
      | I am a man        | active |
      | I have green eyes | active |
      And I am on the home page
      When I follow "Sign Up"
      And I sign up as "mcmaloney"
      Then that user should have 2 questions
      Given I am on the home page
      And I follow "Log Out"
      And I add the following questions :
        | body               | state    |
        | I like cats        | active   |
      And I log in as "mcmaloney"
      Then that user should have 3 questions
    
    
