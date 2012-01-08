# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tumblife::API do
  def create_response(status, msg)
    Hashie::Mash.new({
      body: {
        meta: {
          status: status,
          msg: msg
        },
        response: {}
      }.to_json
    })
  end

  before do
    @api = Tumblife::API.new
  end

  context :request do
    before do
      @token = @api.access_token
    end

    it 'should get' do
      @api.should_receive(:access_token).and_return(@token)
      @token.should_receive(:get).with('/path/to?key1=param1&key2=param2', @api.header).and_return(create_response(200, 'OK'))
      @api.get('/path/to', key1: 'param1', key2: 'param2')
    end

    it 'should post' do
      @api.should_receive(:access_token).and_return(@token)
      @token.should_receive(:post).with('/path/to', {'key1' => 'param1', 'key2' => 'param2'}, @api.header).and_return(create_response(200, 'OK'))
      @api.post('/path/to', key1: 'param1', key2: 'param2')
    end
  end

  context :error do
    it 'should raise APIError' do
      lambda {
        @api.parse_response(create_response(200, 'OK'))
      }.should_not raise_error(Tumblife::APIError)

      lambda {
        @api.parse_response(create_response(301, 'Found'))
      }.should_not raise_error(Tumblife::APIError)

      lambda {
        @api.parse_response(create_response(401, 'Not Authorized'))
      }.should raise_error(Tumblife::APIError)

      lambda {
        @api.parse_response(create_response(404, 'Not Found'))
      }.should raise_error(Tumblife::APIError)
    end
  end

  context :helpers do
    before do
      @params = {name: 'mitukiii', age: 23}
    end

    it 'should convert query string from Hash' do
      @api.parse_params(@params).should == 'name=mitukiii&age=23'
    end

    it 'should stringify keys from Hash' do
      @api.stringify_params(@params).should == {'name' => 'mitukiii', 'age' => '23'}
    end
  end
end
