# frozen_string_literal: true

class StaticController < ApplicationController
  before_action :authenticate_user!
  def welcome
    @apps = current_user.client_apps if user_signed_in?
  end
end
