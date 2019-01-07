# frozen_string_literal: true

When('I fill in {string} with {string}') do |string, string2|
  fill_in string, with: string2
end

When('I press {string}') do |_string|
  click_button('Sign up')
end

Then('I should see {string}') do |string|
  page.should have_content(string)
end
