# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fdl/version"

Gem::Specification.new do |s|
  s.name        = "fdl"
  s.version     = Fdl::VERSION
  s.authors     = ["Ignacy Moryc"]
  s.email       = ["imoryc@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{FDL is a remote logger that is simple to setup and easy to use.}
  s.description = %q{FDL allows you to log messages from your code, and then present them in a readable fashion.}

  s.rubyforge_project = "fdl"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
