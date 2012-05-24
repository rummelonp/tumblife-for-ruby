# -*- coding: utf-8 -*-

unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end

require 'tumblife'
require 'rspec'
require 'webmock/rspec'

def a_get(path, endpoint = Tumblife.endpoint)
  a_request(:get, endpoint + path)
end

def a_post(path, endpoint = Tumblife.endpoint)
  a_request(:post, endpoint + path)
end

def stub_get(path, endpoint = Tumblife.endpoint)
  stub_request(:get, endpoint + path)
end

def stub_post(path, endpoint = Tumblife.endpoint)
  stub_request(:post, endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
