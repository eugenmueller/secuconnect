# frozen_string_literal: true

module Secuconnect
  module Payment
    class ResponseError < StandardError
      attr_accessor :response

      def initialize(response)
        @response = response
        super(response)
      end
    end

    class Client
      class << self
        include Secuconnect::Connection
        include Secuconnect::Authenticated

        private

        def headers
          {
            "Content-Type": "application/json",
            Authorization: "Bearer #{access_token}"
          }
        end

        def access_token
          Secuconnect::Oauth2::Token.find_or_create
        end
      end
    end
  end
end
