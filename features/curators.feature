Feature: Curators
  As a curator
  I want to see questions others have submitted
  So that I can approve them and they can be used on the site
  
  Scenario: Log in as a curator
    Given I am a curator
    And I log in as a curator
    Then I should be on the home page
    And I should see "Logged in as mcmaloney"
    And I should see "Curator Tools"
    And I should see "Log Out"
  
  Scenario: Log in as a user who is not a curator
    Given I am a regular user
    And I log in as a regular
    Then I should be on the home page
    And I should see "Logged in as mcmaloney"
    And I should not see "Curator Tools"
    And I should see "Log Out"
    
  Scenario: Curator views all questions
    Given I am a curator
    And I log in as a curator
    And the following questions exist:
      | body               | state   |
      | I smoke cigarettes | active  |
      | I am a man         | pending |
    And I follow "View All Questions"
    Then I should be on the questions page
    And I should see "I smoke cigarettes"
    And I should see "I am a man"
    
  Scenario: Regular user views all questions
    Given I am a regular user
    And I log in as a regular
    And the following questions exist:
      | body               | state   |
      | I smoke cigarettes | active  |
      | I am a man         | pending |
    And I am on the questions page
    Then I should see "I smoke cigarettes"
    And I should not see "I am a man"
    
  Scenario: Curator activates a pending question
    Given I am a curator
    And I log in as a curator
    And there is a pending question "I find myself fetching"
    And I am on the questions page
    And I follow "Make Active"
    Then I should see "Question activated."
    And I should have 1 active question
  
  Scenario: Curator deactivates an active question
    Given I am a curator
    And I log in as a curator
    And there is an active question "I find myself fetching"
    And I am on the questions page
    And I follow "Deactivate"
    Then I should see "Question deactivated."
    And I should have 1 inactive question
    
    