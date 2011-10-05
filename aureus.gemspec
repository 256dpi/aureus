# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aureus/version"

Gem::Specification.new do |s|
  s.name        = "aureus"
  s.version     = Aureus::VERSION
  s.authors     = ["Joël Gähhwiler"]
  s.email       = ["joel.gaehwiler@bluewin.ch"]
  s.homepage    = "http://www.256dpi.ch"
  s.summary     = "Aureus Admin Template"
  s.description = "Aureus Admin Template"

  #s.rubyforge_project = "Aureus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
