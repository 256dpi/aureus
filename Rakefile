require "rubygems"

gem "highline"
gem "activerecord"
gem "sqlite3"

desc "build and publish"
task :build do
  require "highline/import"
  puts "build gem..."
  `gem build aureus.gemspec`
  Dir["*.gem"].each do |file|
    if agree "publish gem: #{file}? (y,n)"
      puts "publishing gem..."
      `gem push #{file}`
    end
  end
  puts "remove gem..."
  `rm *.gem`
end

task :check do
  require "rails"
  require "active_support"
  require "action_view"
  require "active_record"
  require "aureus"
  require "haml"
  require "aureus/test/resource"
  include Aureus::Helper
  ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
  load "lib/aureus/test/schema.rb"
  @resource = Resource.new
  @resource.title = "the title"
  @resource.text = "Some longer text"
  @resources = [@resource,@resource]
  puts Haml::Engine.new(File.read("test/html.haml")).render(self)
end
