require 'rubygems'
require 'bundler'

require 'combustion'
Combustion.initialize! :all

Bundler.require :default, :development

run Combustion::Application
