# frozen_string_literal: true

class AppToken < ApplicationRecord
  belongs_to :client_app
  before_validation :init_token, on: :create
  has_secure_token

  def init_token
    self.expires_at = Time.current + 1.year
  end

  def regenerate
    return false unless can_regenerate?
    AppToken.create(client_app: client_app)
  end

  def recent_token_count(time_frame)
    token_count = AppToken.where(client_app_id: client_app.id)
      .where("created_at >= ?", time_frame)
      .count
  end

  def can_regenerate?
    token_limit = 10
    recent_token_count(Time.current.utc - 5.days) < token_limit
  end
end
