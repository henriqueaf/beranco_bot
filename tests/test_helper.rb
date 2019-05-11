# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'
require_relative '../config/application'

Dir[File.expand_path("mocks/**/*.rb", __dir__)].each { |file| require file }

# Open Test::Unit::TestCase to default include the Rack::Test::Methods
class Test::Unit::TestCase
  include Rack::Test::Methods
end
