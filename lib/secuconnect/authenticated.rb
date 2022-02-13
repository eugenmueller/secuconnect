# frozen_string_literal: true

module Secuconnect
  module Authenticated
    API_PATH_PREFIX = "api/v2"

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
