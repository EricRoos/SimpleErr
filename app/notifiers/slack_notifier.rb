# frozen_string_literal: true

require 'faraday'
class SlackNotifier
  def notify(msg, webhook_path)
    return false unless msg.present?
    return false unless webhook_path.present?

    conn = Faraday.new(url: webhook_path)
    begin
      response = conn.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = { text: msg }.to_json
      end
      response.status == 200
    rescue Faraday::Error => e
      Rails.logger.error e
      return false
    end
  end
end
