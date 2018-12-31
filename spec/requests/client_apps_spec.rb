require 'rails_helper'

RSpec.describe "ClientApps", type: :request do
  describe "GET /client_apps" do
    it "works! (now write some real specs)" do
      get client_apps_path
      expect(response).to have_http_status(200)
    end
  end
end
