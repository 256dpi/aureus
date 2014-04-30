require 'rubygems'
require 'bundler/setup'
require 'combustion'

Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets do
  config.cache_classes = false
  config.eager_load = false
end

run Combustion::Application
