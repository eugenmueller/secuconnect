# frozen_string_literal: true

module Secuconnect
  module Oauth2
    class Token
      def find_or_create
        Secuconnect.cache.fetch("secuconnect_auth_token", expires_in: token_expiration_time) do
          retrieve_token_from_service
        end
      end

      private

      def retrieve_token_from_service
        response = Client.new.retrieve_token
        body_as_json = JSON.parse(response.body)

        raise StandardError, body_as_json if response.status == 400

        body_as_json["access_token"]
      end

      def token_expiration_time
        Secuconnect.config.secuconnect_token_expiration_seconds
      end
    end
  end
end
