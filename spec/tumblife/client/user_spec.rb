# -*- coding: utf-8 -*-

require 'spec_helper'

describe Tumblife::Client do
  let(:client) { Tumblife.client }

  it 'should respond to dashboard' do
    client.should_receive(:get).with('/v2/user/dashboard', {})
    client.dashboard
    client.should_receive(:get).with('/v2/user/dashboard', :type => :photo)
    client.dashboard :type => :photo
  end

  it 'should respond to likes' do
    client.should_receive(:get).with('/v2/user/likes', {})
    client.likes
    client.should_receive(:get).with('/v2/user/likes', :limit => 10)
    client.likes :limit => 10
  end

  it 'should respond to following' do
    client.should_receive(:get).with('/v2/user/following', {})
    client.following
    client.should_receive(:get).with('/v2/user/following', :limit => 10)
    client.following :limit => 10
  end

  it 'should respond to follow' do
    client.should_receive(:post).with('/v2/user/follow', :url => 'mitukiii.tumblr.com')
    client.follow :url => 'mitukiii.tumblr.com'
  end

  it 'should respond to unfollow' do
    client.should_receive(:post).with('/v2/user/unfollow', :url => 'mitukiii.tumblr.com')
    client.unfollow :url => 'mitukiii.tumblr.com'
  end

  it 'should respond to info_user' do
    client.should_receive(:get).with('/v2/user/info', {})
    client.info_user
  end
end
