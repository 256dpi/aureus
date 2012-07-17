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