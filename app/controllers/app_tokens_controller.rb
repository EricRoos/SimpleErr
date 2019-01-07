# frozen_string_literal: true

class AppTokensController < ApplicationController
  before_action :find_client_app

  def destroy
    AppToken.find(params[:id]).regenerate_token
    redirect_to edit_client_app_path(@client_app)
  end

  def create
    @app_token = @client_app.app_tokens.build
    if @app_token.save
      redirect_to edit_client_app_path(@client_app)
    else
      redirect_to edit_client_app_path(@client_app)
    end
  end

  protected

  def find_client_app
    @client_app = ClientApp.find(params[:client_app_id])
  end
end
