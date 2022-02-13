# frozen_string_literal: true

RSpec.describe Secuconnect::Oauth2::Token, vcr: true do
  it { expect(described_class).to respond_to(:find_or_create) }

  describe ".find_or_create" do
    context "with valid credentials and not cached token" do
      let(:token) { described_class.find_or_create }

      it "retrieves token" do
        expect(token.to_s).is_a? String
      end
    end

    context "with valid credentials" do
      before do
        Secuconnect.cache.delete("secuconnect_auth_token")
      end

      it "raise an error" do
        allow(Secuconnect.config).to receive(:secuconnect_client_id).and_return(nil)

        expect { described_class.find_or_create }.to raise_error(Secuconnect::Oauth2::AuthenticationResponseError)
      end
    end
  end
end
