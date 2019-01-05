require 'rails_helper'

RSpec.describe AppToken, type: :model do
  describe 'after creating' do
    let(:client_app){ ClientApp.create }
    let(:app_token){ AppToken.new(client_app: client_app) }

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
end
