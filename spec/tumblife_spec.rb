# -*- coding: utf-8 -*-

require 'spec_helper'

describe Tumblife do
  after do
    Tumblife.reset
  end

  describe '.client' do
    it 'should return a Tumblife::Client' do
      Tumblife.client.should be_a Tumblife::Client
    end
  end

  describe '.respond_to?' do
    it 'should take an optional argument' do
      Tumblife.respond_to?(:client, true).should be_true
    end
  end

  describe '.adapter' do
    it 'should return the default adapter' do
      Tumblife.adapter.should == Tumblife::Configuration::DEFAULT_ADAPTER
    end
  end

  describe '.adapter=' do
    it 'should set the adapter' do
      Tumblife.adapter = :typhoeus
      Tumblife.adapter.should == :typhoeus
    end
  end

  describe '.endpoint' do
    it 'should return the default endpoint' do
      Tumblife.endpoint.should == Tumblife::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe '.endpoint=' do
    it 'should set the endpoint' do
      Tumblife.endpoint = 'https://api.twitter.com/'
      Tumblife.endpoint.should == 'https://api.twitter.com/'
    end
  end

  describe '.user_agent' do
    it 'should return the default user agent' do
      Tumblife.user_agent.should == Tumblife::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe '.user_agent=' do
    it 'should set the user_agent' do
      Tumblife.endpoint = 'Custom User Agent'
      Tumblife.endpoint.should == 'Custom User Agent'
    end
  end

  describe '.configure' do
    Tumblife::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Tumblife.configure do |config|
          config.send("#{key}=", key)
          Tumblife.send(key).should == key
        end
      end
    end
  end

end
