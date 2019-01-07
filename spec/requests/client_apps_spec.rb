# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ClientApps', type: :request do
  let(:current_user) do
    FactoryBot.create(:user)
  end

  before :each do
    sign_in current_user if current_user
  end
  describe 'GET /client_apps' do
    it 'works! (now write some real specs)' do
      get client_apps_path
      expect(response).to have_http_status(200)
    end
  end
end
