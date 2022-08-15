ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/spec_help"
require File.expand_path("../../config/environment", __FILE__)

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
