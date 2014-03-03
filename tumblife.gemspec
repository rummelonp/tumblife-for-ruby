# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumblife/version'

Gem::Specification.new do |spec|
  spec.name        = 'tumblife'
  spec.version     = Tumblife::VERSION
  spec.authors     = ['Kazuya Takeshima']
  spec.email       = ['mail@mitukiii.jp']
  spec.summary     = %q{A Ruby wrapper for the Tumblr API v2.}
  spec.homepage    = 'https://github.com/mitukiii/tumblife-for-ruby'
  spec.license     = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.8.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_runtime_dependency 'multi_json', '~> 1.7.2'
  spec.add_runtime_dependency 'simple_oauth', '~> 0.2.0'
  spec.add_runtime_dependency 'hashie', '~> 2.0.3'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
end
