require 'rake/testtask'
require 'highline/import'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

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

task :test do
  require "rails"
  require "active_support"
  require "action_view"
  require "aureus"
  include Aureus::Helper
  system "clear"
  out = aureus_toolbar "toolbar" do |t|
    t.left do |l|
      l.button "link_1"
      l.button "link_2"
    end
    t.right do |r|
      r.info "info_1"
      r.button "link_3"
    end
  end
  puts out
  out = aureus_navigation do |n|
    n.title "title"
    n.quicklinks "quicklinks"
  end
  puts out
  puts aureus_messages({ :notice => "notice", :error => "error", :alert => "alert" })
  puts aureus_content "content"
end
