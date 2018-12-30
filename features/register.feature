Feature: Account Registration
  In order to track errors users need to be able to register

  Scenario: Registration
    Given I am on the registration page
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test123456"
    And I fill in "Password confirmation" with "test123456"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

