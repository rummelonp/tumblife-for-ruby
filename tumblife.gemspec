# -*- encoding: utf-8 -*-

require File.expand_path('../lib/tumblife/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'tumblife'
  s.version     = Tumblife::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Kazuya Takeshima']
  s.email       = ['mail@mitukiii.jp']
  s.homepage    = 'https://github.com/mitukiii/tumblife-for-ruby'
  s.summary     = %q{A Ruby wrapper for the Tumblr API v2.}
  s.description = %q{A Ruby wrapper for the Tumblr API v2.}

  s.rubyforge_project = 'tumblife'
  s.add_runtime_dependency 'faraday', '~> 0.8.0'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  s.add_runtime_dependency 'yajl-ruby', '~> 1.1.0'
  s.add_runtime_dependency 'simple_oauth', '~> 0.2.0'
  s.add_runtime_dependency 'hashie', '~> 2.0.3'
  s.add_development_dependency 'json'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
