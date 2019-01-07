# frozen_string_literal: true

Given('I am on the registration page') do
  visit '/users/sign_up'
end

Given('I am on the login page') do
  visit '/users/sign_in'
end
