# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'dotenv/load'
require 'telegram/bot'

paths = %w[config/initializers/*.rb lib/**/*.rb].freeze
paths.each do |path|
  Dir[File.expand_path("../../../#{path}", __FILE__)].each do |file|
    next if file.include?('initializers/autoloader') # skip me

    require file
  end
end
