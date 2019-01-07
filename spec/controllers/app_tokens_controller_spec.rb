require 'rails_helper'

RSpec.describe AppTokensController, type: :controller do
  let(:client_app){ ClientApp.create(user: FactoryBot.create(:user), name: 't') }
  describe "POST #create" do
    it "returns http success" do
      post :create, params: {client_app_id: client_app.id}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #destroy" do
    let(:app_token){AppToken.create(client_app: client_app)}
    it "returns http success" do
      delete :destroy, params: {client_app_id: client_app.id, id: app_token.id}
      expect(response).to have_http_status(:redirect)
    end
  end

end
