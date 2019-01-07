# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :debug_request

  def debug_request
    Rails.logger.info request.base_url
    Rails.logger.info request.headers['origin']
  end
end
