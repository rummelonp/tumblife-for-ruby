# -*- coding: utf-8 -*-

require 'spec_helper'

describe Tumblife::Client do
  let(:client) { Tumblife.client }

  describe '.info' do
    before do
      stub_get('/v2/user/info').
        to_return(:body => fixture('info.json'))
    end
    it 'should request the correct resource' do
      client.info
      a_get('/v2/user/info').
        should have_been_made
    end
    it 'should return user info' do
      info = client.info
      info.user.name.should == 'mmtki'
      info.user.blogs.should be_a Array
    end
  end

  describe '.dashboard' do
    before do
      stub_get('/v2/user/dashboard').
        to_return(:body => fixture('dashboard.json'))
    end
    it 'should request the correct resource' do
      client.dashboard
      a_get('/v2/user/dashboard').
        should have_been_made
    end
    it 'should return dashboard posts' do
      dashboard = client.dashboard
      dashboard.posts.should be_a Array
      dashboard.posts.size.should == 20
      dashboard.posts.first.blog_name == 'mmtki'
    end
  end

  describe '.likes' do
    before do
      stub_get('/v2/user/likes').
        with(:query => {:offset => '0', :limit => '20'}).
        to_return(:body => fixture('likes.json'))
    end
    it 'should request the correct resource' do
      client.likes
      a_get('/v2/user/likes').
        with(:query => {:offset => '0', :limit => '20'}).
        should have_been_made
    end
  end

  describe '.following' do
    before do
      stub_get('/v2/user/following').
        with(:query => {:offset => '0', :limit => '20'}).
        to_return(:body => fixture('following.json'))
    end
    it 'should request the correct resource' do
      client.following
      a_get('/v2/user/following').
        with(:query => {:offset => '0', :limit => '20'}).
        should have_been_made
    end
    it 'should return following blogs' do
      following = client.following
      following.blogs.should be_a Array
      following.blogs.size.should == following.total_blogs
      following.blogs.first.blog_name == 'mitukiii'
    end
  end

  describe '.like' do
    before do
      stub_post('/v2/user/like').
        with(:body => {:id => '123456789', :reblog_key => 'abcdef'}).
        to_return(:body => fixture('like.json'))
    end
    it 'should request the correct resource' do
      client.like(123456789, 'abcdef')
      a_post('/v2/user/like').
        with(:body => {:id => '123456789', :reblog_key => 'abcdef'}).
        should have_been_made
    end
  end

  describe '.unlike' do
    before do
      stub_post('/v2/user/unlike').
        with(:body => {:id => '123456789', :reblog_key => 'abcdef'}).
        to_return(:body => fixture('unlike.json'))
    end
    it 'should request the correct resource' do
      client.unlike(123456789, 'abcdef')
      a_post('/v2/user/unlike').
        with(:body => {:id => '123456789', :reblog_key => 'abcdef'}).
        should have_been_made
    end
  end

  describe '.follow' do
    before do
      stub_post('/v2/user/follow').
        with(:body => {:url => 'mitukiii.tumblr.com'}).
        to_return(:body => fixture('follow.json'))
    end
    it 'should request the correct resource' do
      client.follow('mitukiii.tumblr.com')
      a_post('/v2/user/follow').
        with(:body => {:url => 'mitukiii.tumblr.com'}).
        should have_been_made
    end
  end

  describe '.unfollow' do
    before do
      stub_post('/v2/user/unfollow').
        with(:body => {:url => 'mitukiii.tumblr.com'}).
        to_return(:body => fixture('unfollow.json'))
    end
    it 'should request the correct resource' do
      client.unfollow('mitukiii.tumblr.com')
      a_post('/v2/user/unfollow').
        with(:body => {:url => 'mitukiii.tumblr.com'}).
        should have_been_made
    end
  end
end
