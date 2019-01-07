# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  let(:current_user) do
    FactoryBot.create(:user)
  end

  before :each do
    sign_in current_user if current_user
  end
  describe 'GET #welcome' do
    it 'returns http success' do
      get :welcome
      expect(response).to have_http_status(:redirect)
    end
  end
end
