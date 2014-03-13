require 'rubygems'
require 'bundler'

require 'combustion'
Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets

Bundler.require :default, :development

run Combustion::Application
