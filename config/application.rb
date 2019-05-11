# frozen_string_literal: true

require 'dotenv/load'
require 'bundler'

# Bundle.require execute require on all gems listed on Gemfile
Bundler.require(:default, ENV['RACK_ENV'])

require_relative 'initializers/autoloader'
