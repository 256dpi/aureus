require 'rubygems'
require 'bundler/setup'

require 'combustion'

Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets do
  I18n.enforce_available_locales = false
end

require 'rspec/rails'
require 'generator_spec'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end
