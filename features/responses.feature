Feature: Responses
  As a user
  I want to respond to questions
  And I want to have my responses saved
  And I want my answers to correspond to the correct questions
  So that I can see my binary number
  
  Scenario: User views questions
    Given I have already created a profile for "mcmaloney"
    And I log in
    And there is an active question "Hope is lost"
    When I follow "Provide Responses"
    Then I should see "Hope is lost"
  
    
    
    