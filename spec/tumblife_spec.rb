require 'spec_helper'

describe Tumblife do
  after do
    Tumblife.reset
  end

  context 'when delegating to a client' do
    before do
      stub_get('/v2/user/info').
        to_return(:body => fixture('info.json'))
    end

    it 'should request the correct resource' do
      Tumblife.info
      expect(stub_get('/v2/user/info')).
        to have_been_made
    end

    it 'should return the same results as a client' do
      expect(Tumblife.info).to eq(Tumblife::Client.new.info)
    end
  end

  describe '.client' do
    it 'should return a Tumblife::Client' do
      expect(Tumblife.client).to be_a Tumblife::Client
    end
  end

  describe '.respond_to?' do
    it 'should take an optional argument' do
      expect(Tumblife.respond_to?(:client, true)).to be_true
    end
  end

  describe '.adapter' do
    it 'should return the default adapter' do
      expect(Tumblife.adapter).to eq(Tumblife::Configuration::DEFAULT_ADAPTER)
    end
  end

  describe '.adapter=' do
    it 'should set the adapter' do
      Tumblife.adapter = :typhoeus
      expect(Tumblife.adapter).to eq(:typhoeus)
    end
  end

  describe '.endpoint' do
    it 'should return the default endpoint' do
      expect(Tumblife.endpoint).to eq(Tumblife::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe '.endpoint=' do
    it 'should set the endpoint' do
      Tumblife.endpoint = 'https://api.twitter.com/'
      expect(Tumblife.endpoint).to eq('https://api.twitter.com/')
    end
  end

  describe '.user_agent' do
    it 'should return the default user agent' do
      expect(Tumblife.user_agent).to eq(Tumblife::Configuration::DEFAULT_USER_AGENT)
    end
  end

  describe '.user_agent=' do
    it 'should set the user_agent' do
      Tumblife.endpoint = 'Custom User Agent'
      expect(Tumblife.endpoint).to eq('Custom User Agent')
    end
  end

  describe '.configure' do
    Tumblife::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Tumblife.configure do |config|
          config.send("#{key}=", key)
          expect(Tumblife.send(key)).to eq(key)
        end
      end
    end
  end

end
