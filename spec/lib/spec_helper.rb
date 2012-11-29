require "rubygems"
require "bundler/setup"

require "rails/all"
require "aureus"
require "haml"

Bundler.require :default, :test

include Aureus::Helper

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load "spec/lib/helper/schema.rb"
load "spec/lib/helper/resource.rb"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"
end
