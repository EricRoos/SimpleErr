Given("I am registered") do
  @current_user_password = 'test123456'
  @current_user = FactoryBot.create(:user, password: @current_user_password)
end

When("I register for an account") do
  steps %{
    Given I am on the registration page
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test123456"
    And I fill in "Password confirmation" with "test123456"
    And I press "Sign up"
  }
end

When("I login") do
  steps %{
    Given I am on the login page
    When I fill in "Email" with "#{@current_user.email}"
    And I fill in "Password" with "#{@current_user_password}"
    And I press "Log in"
  }
end
