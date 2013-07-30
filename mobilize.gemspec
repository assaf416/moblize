# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mobilze/version"

Gem::Specification.new do |s|
  s.name        = "mobilze"
  s.version     = Mobilze::VERSION
  s.authors     = ["Assaf Goldstein"]
  s.email       = ["assaf.goldstein@gmail.com"]
  s.homepage    = "https://github.com/assaf416/mobilze"
  s.summary     = %q{ Adds mobile support for rails applications using open source libraries}
  s.description = %q{Generator and helpers to easily create moblie version of a rails app}

  s.rubyforge_project = "mobilze"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
end
