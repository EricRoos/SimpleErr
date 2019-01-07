# frozen_string_literal: true

class ClientAppError < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :client_app

  after_create :notify_parties

  scope :recent, -> { where('created_at >= ? ', Time.current.utc - 5.days).order('created_at desc') }

  validates_presence_of :message, :exception_name

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
