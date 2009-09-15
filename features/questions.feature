Feature: Questions
  As a user
  I want to have a list of questions that is updated as they are added by curators
  So that I can answer all the activated questions
  And I want my number to be as long (in digits) as the number of active questions
  So that I can see my number and do cool stuff with it
  
  Scenario: User can see all active questions
    Given I am logged in as "mcmaloney"
    And the following questions exist:
      | body               | state    |
      | I smoke cigarettes | active   |
      | I have green eyes  | active   |
      | I like eggs        | inactive |
    When I follow "See all questions"
    Then I should see "I smoke cigarettes"
    And I should see "I have green eyes"
    And I should not see "I like eggs"
  
    
    
 
      
      
    
    
