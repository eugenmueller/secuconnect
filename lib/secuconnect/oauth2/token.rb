module Secuconnect
  module Oauth2
    class Token
      class << self
        def find_or_create
          Secuconnect.cache.fetch('secuconnect_auth_token', expires_in: token_expiration_time) do
            response = Client.retrieve_token
            response_body_as_json = JSON.parse(response.body)

            raise StandardError.new response_body_as_json unless response_body_as_json['access_token']

            response_body_as_json['access_token'] 
          end
        end
  
        def token_expiration_time
          Secuconnect.config.secuconnect_token_expiration_seconds
        end
      end
    end
  end
end