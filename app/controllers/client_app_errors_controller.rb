# frozen_string_literal: true

class ClientAppErrorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_client_app
  def create
    @client_app_error = @client_app.client_app_errors.build(client_app_error_params)
    if @client_app_error.save
      render json: @client_app_error, status: :created
    else
      render json: @client_app_error.errors, status: :unprocessable_entity
    end
  end

  def client_app_error_params
    params.require(:client_app_error).permit(:exception_name, :backtrace, :message)
  end

  protected

  def find_client_app
    @client_app = ClientApp.find(params[:client_app_id])
  end
end
