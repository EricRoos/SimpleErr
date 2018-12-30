require 'faraday'
class SlackNotifier
  def notify(msg, webhook_path)
    webhook_host = 'https://hooks.slack.com'
    conn = Faraday.new(:url => webhook_host)
    begin
      response = conn.post do |req|
        req.url webhook_path
        req.headers['Content-Type'] = 'application/json'
        req.body = {text: msg}.to_json
      end
      response.status == 200
    rescue Faraday::ConnectionFailed => e
      logger.error e
      return false
    end
  end
end
