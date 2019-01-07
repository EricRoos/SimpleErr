# frozen_string_literal: true

class StaticController < ApplicationController
  before_action :authenticate_user!
  def welcome
    if(user_signed_in?)
      redirect_to client_apps_path
    end
  end
end
