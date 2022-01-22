RSpec.describe Secuconnect::Oauth2::Client, vcr: true do
  it { expect(described_class).to respond_to(:connection) }
  it { expect(described_class).to respond_to(:retrieve_token) }

  describe '.retrieve_token' do
    subject(:response) { described_class.retrieve_token }
    
    context 'with valid credentials' do
      it 'respond successfully with access_token' do
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)).to have_key('access_token')
      end
    end

    context 'with invalid credentials' do
      before { Secuconnect.config.secuconnect_client_id = nil }

      it 'respond with an error' do
        expect(response.status).to be(400)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end
end