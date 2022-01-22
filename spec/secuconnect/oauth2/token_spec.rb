RSpec.describe Secuconnect::Oauth2::Token, vcr: true do
  it { expect(described_class).to respond_to(:find_or_create) }

  describe '.find_or_create' do
    context 'with valid credentials and not cached token' do
      subject(:result) { described_class.find_or_create }

      it 'retrieves token' do
        expect(result.to_s).to eq(Secuconnect.cache.read('secuconnect_auth_token').to_s)
      end
    end

    context 'with valid credentials' do
      before do
        Secuconnect.cache.delete('secuconnect_auth_token')
        Secuconnect.config.secuconnect_client_id = 'foo'
      end

      it 'raise an error' do
        expect { described_class.find_or_create }.to raise_error(StandardError)
      end
    end
  end
end