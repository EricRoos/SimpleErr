# frozen_string_literal: true

class AppToken < ApplicationRecord
  belongs_to :client_app
  before_validation :init_token, on: :create
  has_secure_token

  def init_token
    self.expires_at = Time.current + 1.year
  end
end
