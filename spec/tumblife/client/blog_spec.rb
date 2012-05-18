# -*- coding: utf-8 -*-

require 'spec_helper'

describe Tumblife::Client do
  let(:client) { Tumblife.client }

  it 'should respond to info' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/info', :api_key => @api_key)
    client.info 'mitukiii.tumblr.com'
  end

  it 'should respond to avatar' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/avatar', {})
    client.avatar 'mitukiii.tumblr.com'
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/avatar', :size => 512)
    client.avatar 'mitukiii.tumblr.com', :size => 512
  end

  it 'should respond to followers' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/followers', {})
    client.followers 'mitukiii.tumblr.com'
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/followers', :limit => 10)
    client.followers 'mitukiii.tumblr.com', :limit => 10
  end

  it 'should respond to posts' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts', :api_key => @api_key)
    client.posts 'mitukiii.tumblr.com'
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts', :api_key => @api_key, :type => :photo)
    client.posts 'mitukiii.tumblr.com', :type => :photo
  end

  it 'should respond to queue' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/queue', {})
    client.queue 'mitukiii.tumblr.com'
  end

  it 'should respond to draft' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/draft', {})
    client.draft 'mitukiii.tumblr.com'
  end

  it 'should respond to submission' do
    client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/submission', {})
    client.submission 'mitukiii.tumblr.com'
  end

  it 'should respond to create_post' do
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :text, :body => 'text')
    client.create_post 'mitukiii.tumblr.com', :type => :text, :body => 'text'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :photo, :source => 'http://example.com/photo.png')
    client.create_post 'mitukiii.tumblr.com', :type => :photo, :source => 'http://example.com/photo.png'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :quote, :quote => 'quote')
    client.create_post 'mitukiii.tumblr.com', :type => :quote, :quote => 'quote'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :link, :url => 'http://example.com/')
    client.create_post 'mitukiii.tumblr.com', :type => :link, :url => 'http://example.com/'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :chat, :conversation => 'conversation')
    client.create_post 'mitukiii.tumblr.com', :type => :chat, :conversation => 'conversation'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :audio, :external_url => 'http://example.com/audio.mp3')
    client.create_post 'mitukiii.tumblr.com', :type => :audio, :external_url => 'http://example.com/audio.mp3'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', :type => :video, :embed => '<embed>code</embed>')
    client.create_post 'mitukiii.tumblr.com', :type => :video, :embed => '<embed>code</embed>'
  end

  it 'should respond to edit_post' do
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/edit', :id => 123456789, :type => :text, :body => 'new text')
    client.edit_post 'mitukiii.tumblr.com', :id => 123456789, :type => :text, :body => 'new text'
  end

  it 'should respond to reblog' do
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/reblog', :id => 123456789, :reblog_key => 'abcdefg')
    client.reblog_post 'mitukiii.tumblr.com', :id => 123456789, :reblog_key => 'abcdefg'
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/reblog', :id => 123456789, :reblog_key => 'abcdefg', :comment => 'comment')
    client.reblog_post 'mitukiii.tumblr.com', :id => 123456789, :reblog_key => 'abcdefg', :comment => 'comment'
  end

  it 'should respond to delete' do
    client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/delete', :id => 123456789)
    client.delete_post 'mitukiii.tumblr.com', :id => 123456789
  end
end
