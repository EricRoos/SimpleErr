require 'rails_helper'

describe SlackNotifier do
  describe '#notify' do
    let(:message) { 'Test Message' }
    subject { described_class.new.notify(message) } 
    context 'when we succesffully post to slack' do
      it { is_expected.to be true }
    end
  end
end
