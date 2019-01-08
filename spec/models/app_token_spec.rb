# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppToken, type: :model do
  let(:client_app) { ClientApp.create }
  let(:app_token) { AppToken.new(client_app: client_app) }
  describe 'after creating' do
    before :each do
      Timecop.freeze('2019-01-01 4:50 PM UTC')
      expect(app_token).to receive(:init_token).and_call_original
      app_token.save
    end

    after do
      Timecop.return
    end

    describe 'the app token' do
      subject { app_token }
      it { is_expected.to have_attributes(token: a_string_matching(/.+/)) }
      it { is_expected.to have_attributes(expires_at: Time.current + 1.year) }
    end
  end

  describe '#regenerate' do
    before do
      allow(app_token).to receive(:can_regenerate?).and_return(can_regenerate)
    end

    subject { app_token.regenerate }

    context 'when token can regenerate' do
      let(:can_regenerate){ true }
      it { is_expected.to be_a AppToken }
      it { is_expected.to_not eq(subject.id) }
      describe 'its persistence' do
        subject { super().persisted? }
        it { is_expected.to be true }
      end
    end

    context 'when cannot regenerate' do
      let(:can_regenerate){ false }
      it { is_expected.to be false }
    end
  end

  describe '#can_regenerate?' do
    before do
      previous_app_token_count.times do
        AppToken.create(client_app: client_app)
      end
    end
    subject { app_token.can_regenerate? }
    context 'when there have been no previous app tokens' do
      let(:previous_app_token_count){ 0 }
      it { is_expected.to be true }
    end
    context 'more than the limit of previous app tokens' do
      let(:previous_app_token_count){ 10 }
      it { is_expected.to be false }
    end
    context 'a few previouw app token' do
      let(:previous_app_token_count){ 3 }
      it { is_expected.to be true }
    end

    context 'when there are more than the limit but the time period has passed' do
      let(:previous_app_token_count){ 10 }
      it '' do
        Timecop.freeze(Date.today + 1.week) do
          expect(subject).to eq(true)
        end
      end
    end
  end
end
