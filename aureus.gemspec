# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)
require 'aureus/version'

Gem::Specification.new do |s|
  s.name = 'aureus'
  s.version = Aureus::VERSION
  s.summary = 'a nice looking framework for your rails admin interfaces'
  s.description = 'Aureus is a tool to quickly generate admin interfaces for a rails app. Its between scaffolding and tools like ActiveAdmin.'
  s.license = 'MIT'

  s.author = 'Joël Gähhwiler'
  s.email = 'joel.gaehwiler@bluewin.ch'
  s.homepage = 'https://github.com/256dpi/aureus'
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_runtime_dependency 'sass-rails', '~> 5.0'
  s.add_runtime_dependency 'jquery-rails', '~> 3.0'
  s.add_runtime_dependency 'haml-rails', '~> 0.5'
  s.add_runtime_dependency 'formtastic', '~> 3.0'
  s.add_runtime_dependency 'normalize-rails', '~> 3.0'
end
