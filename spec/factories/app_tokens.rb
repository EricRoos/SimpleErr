FactoryBot.define do
  factory :app_token do
    client_app { nil }
    token { "MyString" }
    expires { "2019-01-04 21:11:45" }
  end
end
