# -*- coding: utf-8 -*-

require 'spec_helper'

describe Tumblife::Client do
  let(:api_key) { 'api_key' }
    let(:blog) { 'mmtki.tumblr.com' }
  let(:client) do
    Tumblife.configure {|config|
      config.consumer_key = api_key
    }.client
  end

  describe '.blog_info' do
    before do
      stub_get("/v2/blog/#{blog}/info").
        with(:query => {:api_key => api_key}).
        to_return(:body => fixture('blog_info.json'))
    end
    it 'should request the correct resource' do
      client.blog_info(blog)
      a_get("/v2/blog/#{blog}/info").
        with(:query => {:api_key => api_key}).
        should have_been_made
    end
    it 'should return blog info' do
      info = client.blog_info(blog)
      info.blog.name == 'mmtki'
    end
  end

  describe '.avatar' do
    before do
      stub_get("/v2/blog/#{blog}/avatar").
        with(:query => {:size => 64}).
        to_return(:body => fixture('avatar.json'))
    end
    it 'should request the correct resource' do
      client.avatar(blog)
      a_get("/v2/blog/#{blog}/avatar").
        with(:query => {:size => 64}).
        should have_been_made
    end
    it 'should return blog avatar' do
      avatar = client.avatar(blog)
      avatar.avatar_url == 'http://25.media.tumblr.com/avatar_0ade4b983345_64.png'
    end
  end

  describe '.followers' do
    before do
      stub_get("/v2/blog/#{blog}/followers").
        to_return(:body => fixture('followers.json'))
    end
    it 'should request the correct resource' do
      client.followers(blog)
      a_get("/v2/blog/#{blog}/followers").
        should have_been_made
    end
    it 'should return blog followers' do
      followers = client.followers(blog)
      followers.blogs.should be_a Array
      followers.blogs.size.should == followers.total_blogs
      followers.blogs.first.blog_name == 'mitukiii'
    end
  end

  describe '.posts' do
    before do
      stub_get("/v2/blog/#{blog}/posts").
        with(:query => {:api_key => api_key}).
        to_return(:body => fixture('posts.json'))
    end
    it 'should request the correct resource' do
      client.posts(blog)
      a_get("/v2/blog/#{blog}/posts").
        with(:query => {:api_key => api_key}).
        should have_been_made
    end
    it 'should return blog posts' do
      posts = client.posts(blog)
      posts.blog.name.should == 'mmtki'
      posts.posts.should be_a Array
      posts.posts.size.should == 20
      posts.posts.first.blog_name == 'mmtki'
    end
  end

  describe '.queue' do
    before do
      stub_get("/v2/blog/#{blog}/posts/queue").
        to_return(:body => fixture('queue.json'))
    end
    it 'should request the correct resource' do
      client.queue(blog)
      a_get("/v2/blog/#{blog}/posts/queue").
        should have_been_made
    end
    it 'should return blog queue' do
      queue = client.queue(blog)
      queue.posts.should be_a Array
    end
  end

  describe '.draft' do
    before do
      stub_get("/v2/blog/#{blog}/posts/draft").
        to_return(:body => fixture('draft.json'))
    end
    it 'should request the correct resource' do
      client.draft(blog)
      a_get("/v2/blog/#{blog}/posts/draft").
        should have_been_made
    end
    it 'should return blog draft' do
      draft = client.draft(blog)
      draft.posts.should be_a Array
    end
  end

  describe '.submission' do
    before do
      stub_get("/v2/blog/#{blog}/posts/submission").
        to_return(:body => fixture('submission.json'))
    end
    it 'should request the correct resource' do
      client.submission(blog)
      a_get("/v2/blog/#{blog}/posts/submission").
        should have_been_made
    end
    it 'should return blog submission' do
      submission = client.submission(blog)
      submission.posts.should be_a Array
    end
  end

  describe '.create_post' do
    context :text do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'text', :title => 'title', :body => 'text'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :text, :title => 'title', :body => 'text')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'text', :title => 'title', :body => 'text'}).
          should have_been_made
      end
    end

    context :photo do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'photo', :caption => 'caption', :source => 'http://example.com/photo.png'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :photo, :caption => 'caption', :source => 'http://example.com/photo.png')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'photo', :caption => 'caption', :source => 'http://example.com/photo.png'}).
          should have_been_made
      end
    end

    context :quote do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'quote', :quote => 'quote', :source => 'http://example.com/'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :quote, :quote => 'quote', :source => 'http://example.com/')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'quote', :quote => 'quote', :source => 'http://example.com/'}).
          should have_been_made
      end
    end

    context :link do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'link', :title => 'title', :link => 'http://example.com/'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :link, :title => 'title', :link => 'http://example.com/')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'link',  :title => 'title', :link => 'http://example.com/'}).
          should have_been_made
      end
    end

    context :chat do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'chat', :title => 'title', :conversation => 'conversation'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :chat, :title => 'title', :conversation => 'conversation')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'chat',  :title => 'title', :conversation => 'conversation'}).
          should have_been_made
      end
    end

    context :audio do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'audio', :caption => 'caption', :external_url => 'http://example.com/audio.mp3'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :audio, :caption => 'caption', :external_url => 'http://example.com/audio.mp3')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'audio',  :caption => 'caption', :external_url => 'http://example.com/audio.mp3'}).
          should have_been_made
      end
    end

    context :video do
      before do
        stub_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'video', :caption => 'caption', :embed => 'http://example.com/video.mp4'}).
          to_return(:body => fixture('post.json'))
      end
      it 'should request the correct resource' do
        client.create_post(blog, :type => :video, :caption => 'caption', :embed => 'http://example.com/video.mp4')
        a_post("/v2/blog/#{blog}/post").
          with(:body => {:type => 'video',  :caption => 'caption', :embed => 'http://example.com/video.mp4'}).
          should have_been_made
      end
    end
  end

  describe '.edit' do
    before do
      stub_post("/v2/blog/#{blog}/post/edit").
        with(:body => {:id => '123456789', :type => 'text', :title => 'new title', :body => 'new text'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.edit(blog, 123456789, :type => 'text', :title => 'new title', :body => 'new text')
      a_post("/v2/blog/#{blog}/post/edit").
        with(:body => {:id => '123456789', :type => 'text', :title => 'new title', :body => 'new text'}).
        should have_been_made
    end
  end

  describe '.reblog' do
    before do
      stub_post("/v2/blog/#{blog}/post/reblog").
        with(:body => {:id => '123456789', :reblog_key => 'abcdef', :comment => 'comment'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.reblog(blog, 123456789, 'abcdef', 'comment')
      a_post("/v2/blog/#{blog}/post/reblog").
        with(:body => {:id => '123456789', :reblog_key => 'abcdef', :comment => 'comment'}).
        should have_been_made
    end
  end

  describe '.delete' do
    before do
      stub_post("/v2/blog/#{blog}/post/delete").
        with(:body => {:id => '123456789'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.delete(blog, 123456789)
      a_post("/v2/blog/#{blog}/post/delete").
        with(:body => {:id => '123456789'}).
        should have_been_made
    end
  end
end
