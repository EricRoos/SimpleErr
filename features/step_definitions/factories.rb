Given("I have a client app") do
  @client_app = ClientApp.create(name: 'test', user: @current_user)
end

Given("I have an existing app token") do
  @client_app.app_tokens.create
end
