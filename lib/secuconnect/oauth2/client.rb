module Secuconnect
  module Oauth2
    class Client < Base
      GRAND_TYPE = 'client_credentials'

      class << self
        def headers
          { 'Content-Type': 'application/x-www-form-urlencoded' }
        end

        def body
          {
            grant_type: GRAND_TYPE,
            client_id: Secuconnect.config.secuconnect_client_id,
            client_secret: Secuconnect.config.secuconnect_client_secret
          }
        end

        def retrieve_token
          connection.post('oauth/token', body)
        end
      end
    end
  end
end