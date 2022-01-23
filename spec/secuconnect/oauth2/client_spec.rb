RSpec.describe Secuconnect::Oauth2::Client, vcr: true do
  describe '.retrieve_token' do
    context 'with valid credentials' do
      subject(:response) { described_class.new.retrieve_token }

      it 'respond successfully with access_token' do
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)).to have_key('access_token')
      end
    end

    context 'with invalid credentials' do
      subject(:response) { described_class.new.retrieve_token }

      it 'respond with an error' do
        allow(Secuconnect.config).to receive(:secuconnect_client_id).and_return(nil)

        expect(response.status).to be(400)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end
end