require 'rubygems'
require 'bundler/setup'

require 'combustion'

Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets

require 'rspec/rails'
require 'generator_spec'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
