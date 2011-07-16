require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tumblife do
  before do
    @consumer = OAuth::Consumer.new('consumer key', 'consumer secret', site: 'http://api.tumblr.com')
    @access_token = OAuth::AccessToken.new(@consumer, 'oauth token', 'oauth token secret')
    @client = Tumblife.new(@access_token)
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
