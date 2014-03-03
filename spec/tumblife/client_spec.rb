require 'spec_helper'

describe Tumblife::Client do
  before do
    @keys = Tumblife::Configuration::VALID_OPTIONS_KEYS
  end

  context 'with module configuration' do
    before do
      Tumblife.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Tumblife.reset
    end

    it 'should inherit module configuration' do
      api = Tumblife::Client.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context 'with class configuration' do
      before do
        @configuration = {
          :adapter => :typhoeus,
          :consumer_key => 'CK',
          :consumer_secret => 'CS',
          :oauth_token => 'OT',
          :oauth_token_secret => 'OS',
          :endpoint => 'https://api.twitter.com',
          :proxy => 'http://mitukiii:secret@proxy.example.com:8080',
          :user_agent => 'Custom User Agent'
        }
      end

      context 'during initialization' do
        it 'should override module configuration' do
          api = Tumblife::Client.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

      context 'after initilization' do
        it 'should override module configuration after initialization' do
          api = Tumblife::Client.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end
    end
  end

  it 'should not cache the user name across clients' do
    stub_get('/v2/user/info').
      to_return(:body => fixture('mmtki.json'))
    client1 = Tumblife.client
    client1.info.user.name.should == 'mmtki'

    stub_get('/v2/user/info').
      to_return(:body => fixture('mitukiii.json'))
    client2 = Tumblife.client
    client2.info.user.name.should == 'mitukiii'
  end
end
