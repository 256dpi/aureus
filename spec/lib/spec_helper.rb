require 'bundler/setup'

require 'combustion'
#require 'capybara/rspec'

Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets
require 'jquery-rails'
require 'i18n-js'

require 'rspec/rails'
#require 'capybara/rails'

require 'haml'

Bundler.require :default, :test

Dir[File.expand_path('../../../lib/aureus/components/*.rb', __FILE__)].each{ |file| require file }

include Aureus::Helper

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
load 'spec/lib/helper/schema.rb'
load 'spec/lib/helper/resource.rb'

5.times do |i|
  Resource.create!(id: i, title: 'the title', text: 'some long text')
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
