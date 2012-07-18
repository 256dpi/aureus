require 'highline/import'

desc "build and publish"
task :build do
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
  require "aureus"
  require "haml"
  include Aureus::Helper
  puts Haml::Engine.new(File.read("test/html.haml")).render
end
