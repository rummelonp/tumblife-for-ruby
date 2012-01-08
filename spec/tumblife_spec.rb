require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tumblife do
  describe :client do
    it 'should be a Tumblife::Client' do
      Tumblife.client.should be_a Tumblife::Client
    end
  end

  describe :endpoint do
    it 'should == Tumblife::Configuration::DEFAULT_ENDPOINT' do
      Tumblife.endpoint.should == Tumblife::Configuration::DEFAULT_ENDPOINT
    end
  end
end
