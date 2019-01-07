# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IntegrationsController, type: :controller do
  let(:client_app) { ClientApp.create(user: FactoryBot.create(:user), name: 't') }
  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { id: client_app.id }
      expect(response).to have_http_status(:success)
    end
  end
end
