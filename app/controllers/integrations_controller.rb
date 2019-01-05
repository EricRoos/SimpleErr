class IntegrationsController < ApplicationController
  before_action :find_client_app
  def index
    @app_token = @client_app.app_tokens.last
  end
  protected

  def find_client_app
    @client_app = ClientApp.includes(:app_tokens).find(params[:id])
  end
end
