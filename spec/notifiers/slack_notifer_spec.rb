require 'rails_helper'

WEBHOOK_PATH = 'https://hooks.slack.com/services/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'

describe SlackNotifier do
  describe '#notify', :vcr do
    let(:message) { 'Test Message' }
    let(:webhook_path) { WEBHOOK_PATH } 
    subject { described_class.new.notify(message, webhook_path) } 
    context 'with a valid message' do
      it { is_expected.to be true }
    end
    context 'with a nil message', :vcr do
      let(:message) { nil }
      it { is_expected.to be false }
    end
    context 'with a nil webhook', :vcr do
      let(:webhook_path) { nil }
      it { is_expected.to be false }
    end
    context 'the connection throws an exception' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:post).and_raise(Faraday::ConnectionFailed, 'bad')
      end 
      it { is_expected.to be false }
    end
  end
end
