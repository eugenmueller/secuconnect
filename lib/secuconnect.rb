# frozen_string_literal: true

require "faraday"
require "active_support"
require_relative "secuconnect/configuration"
require_relative "secuconnect/version"
require_relative "secuconnect/connection"
require_relative "secuconnect/authenticated"
require_relative "secuconnect/oauth2/client"
require_relative "secuconnect/oauth2/token"
require_relative "secuconnect/payment/client"
require_relative "secuconnect/payment/contract"
module Secuconnect
  class Error < StandardError; end
  # Configuration of global settings for Secupay
  # Secuconnect.configure do |config|
  #   config.secuconnect_client_id = '123ab'
  # end
  class << self
    attr_accessor :config, :cache

    def configure
      self.cache ||= ActiveSupport::Cache::MemoryStore.new
      self.config ||= Configuration.new
      yield config
    end

    def reset
      self.config = Configuration.new
    end
  end
end
