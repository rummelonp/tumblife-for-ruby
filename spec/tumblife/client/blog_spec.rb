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
      expect(a_get("/v2/blog/#{blog}/info").
        with(:query => {:api_key => api_key})).
        to have_been_made
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
      expect(a_get("/v2/blog/#{blog}/avatar").
        with(:query => {:size => 64})).
        to have_been_made
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
      expect(a_get("/v2/blog/#{blog}/followers")).
        to have_been_made
    end
    it 'should return blog followers' do
      followers = client.followers(blog)
      expect(followers.blogs).to be_a Array
      expect(followers.blogs.size).to eq(followers.total_blogs)
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
      expect(a_get("/v2/blog/#{blog}/posts").
        with(:query => {:api_key => api_key})).
        to have_been_made
    end
    it 'should return blog posts' do
      posts = client.posts(blog)
      expect(posts.blog.name).to eq('mmtki')
      expect(posts.posts).to be_a Array
      expect(posts.posts.size).to eq(20)
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
      expect(a_get("/v2/blog/#{blog}/posts/queue")).
        to have_been_made
    end
    it 'should return blog queue' do
      queue = client.queue(blog)
      expect(queue.posts).to be_a Array
    end
  end

  describe '.draft' do
    before do
      stub_get("/v2/blog/#{blog}/posts/draft").
        to_return(:body => fixture('draft.json'))
    end
    it 'should request the correct resource' do
      client.draft(blog)
      expect(a_get("/v2/blog/#{blog}/posts/draft")).
        to have_been_made
    end
    it 'should return blog draft' do
      draft = client.draft(blog)
      expect(draft.posts).to be_a Array
    end
  end

  describe '.submission' do
    before do
      stub_get("/v2/blog/#{blog}/posts/submission").
        to_return(:body => fixture('submission.json'))
    end
    it 'should request the correct resource' do
      client.submission(blog)
      expect(a_get("/v2/blog/#{blog}/posts/submission")).
        to have_been_made
    end
    it 'should return blog submission' do
      submission = client.submission(blog)
      expect(submission.posts).to be_a Array
    end
  end
end
