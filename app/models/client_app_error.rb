class ClientAppError < ApplicationRecord
  include ActionView::Helpers::DateHelper

  after_create :notify_parties

  def to_s(timezone = 'America/Chicago')
    "#{exception_name} triggered #{time_ago_in_words(created_at.in_time_zone(timezone))} ago"
  end

  def notify_parties
    webhook_url = 'https://hooks.slack.com/services/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'
    SlackNotifier.new.tap do |slack|
      slack.notify to_s, webhook_url
    end
  end
end
