# frozen_string_literal: true

paths = %w[config/initializers/*.rb lib/**/*.rb].freeze
paths.each do |path|
  Dir[File.expand_path("../../../#{path}", __FILE__)].each do |file|
    next if file.include?('initializers/autoloader') # skip me

    require file
  end
end
