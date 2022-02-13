# frozen_string_literal: true

module Secuconnect
  module Oauth2
    class AuthenticationResponseError < StandardError
      attr_reader :response

      def initialize(response)
        @response = response
        super(response)
      end
    end

    class Token
      class << self
        def find_or_create
          Secuconnect.cache.fetch("secuconnect_auth_token", expires_in: token_expiration_time) do
            retrieve_token_from_service
          end
        end

        private

        def retrieve_token_from_service
          response = Client.retrieve_token
          body_as_json = JSON.parse(response.body)

          raise AuthenticationResponseError.new(response), "Secuconnect authentication error" unless response.success?

          body_as_json["access_token"]
        end

        def token_expiration_time
          Secuconnect.config.secuconnect_token_expiration_seconds
        end
      end
    end
  end
end
