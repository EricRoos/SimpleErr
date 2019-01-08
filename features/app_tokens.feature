Feature: Account Registration
  In order to integrate apps I need an app token

  Scenario: Creating
    Given I am registered
    And I have a client app
    When I login
    And I go to the modify client app page
    And I click on 'Generate Token'
    Then I should see "Generated a new token"

  Scenario: Creating
    Given I am registered
    And I have a client app
    And I have an existing app token
    When I login
    And I go to the modify client app page
    And I click on 'Refresh'
    Then I should see "Generated a new token"
