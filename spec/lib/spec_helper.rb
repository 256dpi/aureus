require "rubygems"
require "bundler"

require "rails"
require "active_support"
require "action_view"
require "active_record"
require "aureus"
require "haml"

Bundler.require :default, :test

include Aureus::Helper

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load "spec/lib/helper/schema.rb"
load "spec/lib/helper/resource.rb"

@resource = Resource.create! title: "the title", text: "some long text"
@resources = [@resource,@resource]

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"
end
