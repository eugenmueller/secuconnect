# frozen_string_literal: true

module Secuconnect
  class Configuration
    attr_accessor :secuconnect_client_id, :secuconnect_client_secret, :secuconnect_base_url,
                  :secuconnect_token_expiration_seconds

    def initialize
      @secuconnect_client_id = "09ae83af7c37121b2de929b211bad944"
      @secuconnect_client_secret = "9c5f250b69f6436cb38fd780349bc00810d8d5051d3dcf821e428f65a32724bd"
      @secuconnect_base_url = "https://connect-testing.secupay-ag.de/"
      @secuconnect_token_expiration_seconds = 1200
    end
  end
end
