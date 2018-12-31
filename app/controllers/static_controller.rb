class StaticController < ApplicationController
  before_action :authenticate_user!
  def welcome
    if user_signed_in?
      @apps = current_user.client_apps
    end
  end
end
