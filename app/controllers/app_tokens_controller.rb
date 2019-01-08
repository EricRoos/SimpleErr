# frozen_string_literal: true

class AppTokensController < ApplicationController
  before_action :find_client_app

  def destroy
    @new_app_token = AppToken.find(params[:id]).regenerate
    if @new_app_token
      flash[:notice] = 'Generated a new token'
    else
      flash[:alert] = 'Could not regenerate token'
    end
    redirect_to edit_client_app_path(@client_app)
  end

  def create
    @app_token = @client_app.app_tokens.create
    flash[:notice] = 'Generated a new token' if @app_token.persisted?
    redirect_to edit_client_app_path(@client_app)
  end

  protected

  def find_client_app
    @client_app = ClientApp.find(params[:client_app_id])
  end
end
