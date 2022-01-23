# frozen_string_literal: true

module Secuconnect
  module Connection
    def connection
      Faraday.new(url: base_url, headers: headers)
    end

    private

    def base_url
      Secuconnect.config.secuconnect_base_url
    end

    def headers
      raise NoMethodError, "#{self.class} #headers is abstract and have to be implemented in the subclass"
    end
  end
end
