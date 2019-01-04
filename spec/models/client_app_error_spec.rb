require 'rails_helper'

RSpec.describe ClientAppError, type: :model do
  describe 'after_create' do
    describe 'the called methods' do
      let(:client_app){ClientApp.create}
      subject { described_class.new(client_app: client_app, message: 'test', exception_name: 'runtimeerror') }
      before do
        expect(subject).to receive(:notify_parties)
        subject.save
      end
      it { is_expected }
    end
  end

  describe '#to_s' do
    let(:time_zone){ 'America/New_York' }
    let(:exception_name){ 'Runtime Error' }
    let(:client_app_exception) { described_class.new(created_at: created_at, exception_name: exception_name) }
    subject { client_app_exception.to_s(time_zone) }

    context 'when the error happened just now' do
      let(:created_at) { Time.current.utc }
      it { is_expected.to eq "Runtime Error triggered less than a minute ago" }
    end

    context 'when the error happend 20 minutes ago' do
      let(:created_at) { (Time.current - 20.minutes).utc }
      it { is_expected.to eq "Runtime Error triggered 20 minutes ago" }
    end
  end
end
