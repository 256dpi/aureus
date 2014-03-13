require 'rubygems'
require 'bundler'
require 'combustion'

Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
load 'spec/lib/helper/schema.rb'
load 'spec/lib/helper/resource.rb'

run Combustion::Application
