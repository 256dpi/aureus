require 'rubygems'
require 'bundler'
require 'combustion'

#Rails.env = 'development'
Combustion.initialize! :active_record, :action_controller, :action_view, :sprockets

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
load 'spec/lib/helper/schema.rb'
load 'spec/lib/helper/resource.rb'

5.times do |i|
  Resource.create!(id: i, title: 'the title', text: 'some long text')
end

run Combustion::Application
