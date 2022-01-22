# frozen_string_literal: true

RSpec.describe Secuconnect::Configuration do
  describe '.secuconnect_client_id' do
    it { expect(Secuconnect.config.secuconnect_client_id).to eq '09ae83af7c37121b2de929b211bad944' }
    it { expect(Secuconnect.config.secuconnect_client_secret).to eq '9c5f250b69f6436cb38fd780349bc00810d8d5051d3dcf821e428f65a32724bd' }
    it { expect(Secuconnect.config.secuconnect_base_url).to eq 'https://connect-testing.secupay-ag.de/' }
    it { expect(Secuconnect.config.secuconnect_token_expiration_seconds).to be 1200 } 
  end
end
