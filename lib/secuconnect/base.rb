require 'json'

module Secuconnect
  class Base
    class << self
      def connection
        Faraday.new(url: base_url, headers: headers)
      end

      def base_url
        Secuconnect.config.secuconnect_base_url
      end

      def headers
        { "Content-Type": "application/json" }
      end
    end
  end
end