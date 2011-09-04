# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tumblife/version"

Gem::Specification.new do |s|
  s.name        = "tumblife"
  s.version     = Tumblife::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kazuya Takeshima"]
  s.email       = ["mail@mitukiii.jp"]
  s.homepage    = "http://mitukiii.jp"
  s.summary     = %q{Tumblife is a simple Tumblr API v2 library.}
  s.description = %q{Tumblife is a simple Tumblr API v2 library.}

  s.rubyforge_project = "tumblife"
  s.add_dependency("oauth")
  s.add_dependency("json") if RUBY_VERSION < '1.9'
  s.add_dependency("hashie")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
