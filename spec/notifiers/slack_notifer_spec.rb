require 'rails_helper'

WEBHOOK_PATH = '/services/T9JCZLPPA/BF4MYTNQ7/cJ4Ssv1tMpMzOyqgXtL9HOZz'

describe SlackNotifier do
  describe '#notify', :vcr do
    let(:message) { 'Test Message' }
    subject { described_class.new.notify(message, WEBHOOK_PATH) } 
    context 'with a valid message' do
      it { is_expected.to be true }
    end
    context 'with a nil', :vcr do
      let(:message) { nil }
      it { is_expected.to be false }
    end
    context 'posting to slack throws an exception' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:post).and_raise(Faraday::ConnectionFailed, 'bad')
      end 
      it { is_expected.to be false }
    end
  end
end
