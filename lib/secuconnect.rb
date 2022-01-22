# frozen_string_literal: true
require 'faraday'
require 'active_support'
require_relative "secuconnect/configuration"
require_relative "secuconnect/version"

module Secuconnect
  class Error < StandardError; end
  # Configuration of global settings for Secupay
  #   Secumpay.configure do |config|
  #     config.secupay_client_id = '123ab'
  #   end
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
