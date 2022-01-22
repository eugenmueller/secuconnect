# frozen_string_literal: true
require "pry"
require "webmock"
require "secuconnect"
require 'active_support/testing/time_helpers'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each {|file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Include ActiveSupport TimeHelpers
  config.include ActiveSupport::Testing::TimeHelpers

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
