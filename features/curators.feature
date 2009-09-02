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
    
    