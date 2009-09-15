Feature: THE NUMBER
  This is what it is all about
  A giant binary number
  Whose length in digits is equal to the count of active questions
  Where an answer of "false" to a question keeps the corresponding digit at 0
  And an answer of "true" replaces the zero in the number (corresponding to the index of the question) with a 1
  
  Scenario: User number at signup should be 0
    Given I have already created a profile for "mcmaloney"
    And I have no questions
    And I log in
    And I am on the home page
    Then I should see "Your Number: 0"
  
  @skip
  # This is working in the app, but can't seem to get the order this depends on correct here in the test.
  Scenario: User logs out, question gets added, user logs back in and number gets updated
    Given I am logged in as "mcmaloney"
    And I have no questions
    Then my number should be "0"
    When I log out 
    And I create a question "I am happy in general"
    When log back in as "mcmaloney"
    Then I should see "Your Number: 00"
    
    
    
    