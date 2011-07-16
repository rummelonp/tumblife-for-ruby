require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tumblife do
  before do
    @api_key = 'consumer key'
    @consumer = OAuth::Consumer.new(@api_key, 'consumer secret', site: 'http://api.tumblr.com')
    @access_token = OAuth::AccessToken.new(@consumer, 'oauth token', 'oauth token secret')
    @client = Tumblife.new(@access_token)
  end

  context :api do
    it 'should respond to info' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/info', api_key: @api_key)
      @client.info 'mitukiii.tumblr.com'
    end

    it 'should respond to avatar' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/avatar', {})
      @client.avatar 'mitukiii.tumblr.com'
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/avatar', size: 512)
      @client.avatar 'mitukiii.tumblr.com', size: 512
    end

    it 'should respond to followers' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/followers', {})
      @client.followers 'mitukiii.tumblr.com'
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/followers', limit: 10)
      @client.followers 'mitukiii.tumblr.com', limit: 10
    end

    it 'should respond to posts' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts', api_key: @api_key)
      @client.posts 'mitukiii.tumblr.com'
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts', api_key: @api_key, type: :photo)
      @client.posts 'mitukiii.tumblr.com', type: :photo
    end

    it 'should respond to queue' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/queue', {})
      @client.queue 'mitukiii.tumblr.com'
    end

    it 'should respond to draft' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/draft', {})
      @client.draft 'mitukiii.tumblr.com'
    end

    it 'should respond to submission' do
      @client.should_receive(:get).with('/v2/blog/mitukiii.tumblr.com/posts/submission', {})
      @client.submission 'mitukiii.tumblr.com'
    end

    it 'should respond to create_post' do
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :text, body: 'text')
      @client.create_post 'mitukiii.tumblr.com', type: :text, body: 'text'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :photo, source: 'http://example.com/photo.png')
      @client.create_post 'mitukiii.tumblr.com', type: :photo, source: 'http://example.com/photo.png'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :quote, quote: 'quote')
      @client.create_post 'mitukiii.tumblr.com', type: :quote, quote: 'quote'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :link, url: 'http://example.com/')
      @client.create_post 'mitukiii.tumblr.com', type: :link, url: 'http://example.com/'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :chat, conversation: 'conversation')
      @client.create_post 'mitukiii.tumblr.com', type: :chat, conversation: 'conversation'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :audio, external_url: 'http://example.com/audio.mp3')
      @client.create_post 'mitukiii.tumblr.com', type: :audio, external_url: 'http://example.com/audio.mp3'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post', type: :video, embed: '<embed>code</embed>')
      @client.create_post 'mitukiii.tumblr.com', type: :video, embed: '<embed>code</embed>'
    end

    it 'should respond to edit_post' do
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/edit', id: 123456789, type: :text, body: 'new text')
      @client.edit_post 'mitukiii.tumblr.com', id: 123456789, type: :text, body: 'new text'
    end

    it 'should respond to reblog' do
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/reblog', id: 123456789, reblog_key: 'abcdefg')
      @client.reblog_post 'mitukiii.tumblr.com', id: 123456789, reblog_key: 'abcdefg'
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/reblog', id: 123456789, reblog_key: 'abcdefg', comment: 'comment')
      @client.reblog_post 'mitukiii.tumblr.com', id: 123456789, reblog_key: 'abcdefg', comment: 'comment'
    end

    it 'should respond to delete' do
      @client.should_receive(:post).with('/v2/blog/mitukiii.tumblr.com/post/delete', id: 123456789)
      @client.delete_post 'mitukiii.tumblr.com', id: 123456789
    end

    it 'should respond to dashboard' do
      @client.should_receive(:get).with('/v2/user/dashboard', {})
      @client.dashboard
      @client.should_receive(:get).with('/v2/user/dashboard', type: :photo)
      @client.dashboard type: :photo
    end

    it 'should respond to likes' do
      @client.should_receive(:get).with('/v2/user/likes', {})
      @client.likes
      @client.should_receive(:get).with('/v2/user/likes', limit: 10)
      @client.likes limit: 10
    end

    it 'should respond to following' do
      @client.should_receive(:get).with('/v2/user/following', {})
      @client.following
      @client.should_receive(:get).with('/v2/user/following', limit: 10)
      @client.following limit: 10
    end

    it 'should respond to follow' do
      @client.should_receive(:post).with('/v2/user/follow', url: 'mitukiii.tumblr.com')
      @client.follow url: 'mitukiii.tumblr.com'
    end

    it 'should respond to unfollow' do
      @client.should_receive(:post).with('/v2/user/unfollow', url: 'mitukiii.tumblr.com')
      @client.unfollow url: 'mitukiii.tumblr.com'
    end
  end

  context :helpers do
    before do
      @params = {name: 'mitukiii', age: 23}
    end

    it 'should convert query string from Hash' do
      @client.parse_params(@params).should == 'name=mitukiii&age=23'
    end

    it 'should stringify keys from Hash' do
      @client.stringify_params(@params).should == {'name' => 'mitukiii', 'age' => '23'}
    end
  end
end
