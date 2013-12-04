$:.push File.expand_path('../lib', __FILE__)
require 'aureus/version'

Gem::Specification.new do |s|
  s.name = 'aureus'
  s.version = Aureus::VERSION
  s.summary = 'a nice looking framework for your rails admin interfaces'
  s.description = 'Aureus is a tool to quickly generate admin interfaces for a rails app. Its between scaffolding an tools like ActiveAdmin.'
  s.license = 'MIT'

  s.author = 'Joël Gähhwiler'
  s.email = 'joel.gaehwiler@bluewin.ch'
  s.homepage = 'https://github.com/256dpi/aureus'
  
  s.files = `git ls-files`.split('\n')
  s.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')

  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml'
  s.add_dependency 'leaflet-rails'
end