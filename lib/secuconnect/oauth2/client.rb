# frozen_string_literal: true

module Secuconnect
  module Oauth2
    class Client
      include Secuconnect::Connection

      GRAND_TYPE = "client_credentials"

      def retrieve_token
        connection.post("oauth/token", body)
      end

      private

      def headers
        { "Content-Type": "application/x-www-form-urlencoded" }
      end

      def body
        {
          grant_type: GRAND_TYPE,
          client_id: Secuconnect.config.secuconnect_client_id,
          client_secret: Secuconnect.config.secuconnect_client_secret
        }
      end
    end
  end
end
