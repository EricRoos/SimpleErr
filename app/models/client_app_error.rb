class ClientAppError < ApplicationRecord
  after_create :notify_parties

  def to_s
    "#{exception_name} triggered at #{created_at}"
  end

  def notify_parties
    webhook_url = '/services/T9JCZLPPA/BF4MYTNQ7/cJ4Ssv1tMpMzOyqgXtL9HOZz'
    SlackNotifier.new.tap do |slack|
      slack.notify to_s, webhook_url
    end
  end
end
