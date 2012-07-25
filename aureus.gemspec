# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aureus/version"

Gem::Specification.new do |s|

  # Main Info
  s.name = "aureus"
  s.version = Aureus::VERSION
  s.summary = "a nice looking framework for your rails admin interfaces"
  s.description = "Aureus is a tool to quickly generate admin interfaces for a rails app. It's between scaffolding an tools like ActiveAdmin."
  s.license = "MIT"

  # Additional Info
  s.author = "Joël Gähhwiler"
  s.email = "joel.gaehwiler@bluewin.ch"
  s.homepage = "https://github.com/256dpi/aureus"
  
  # Files
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  # Dependencies
  s.add_dependency "formtastic"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml"

end