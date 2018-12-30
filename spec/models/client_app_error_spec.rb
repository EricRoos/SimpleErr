require 'rails_helper'

RSpec.describe ClientAppError, type: :model do
  describe '#after_create' do
    describe 'the called methods' do
      subject { described_class.new }
      before do
        expect(subject).to receive(:notify_parties)
        subject.save
      end
      it { is_expected }
    end
  end
end
