Feature: Account Registration
  In order to track errors users need to be able to register

  Scenario: Registration
    When I register for an account
    Then I should see "Welcome! You have signed up successfully."

  Scenario: Logging in
    Given I am registered
    When I login
    Then I should see "Signed in successfully"

