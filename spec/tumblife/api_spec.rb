# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'Tumblife::API' do
  def create_response(status, msg)
    Hashie::Mash.new({
      :body => {
        :meta => {
          :status => status,
          :msg => msg
        },
        :response => {}
      }.to_json
    })
  end

  before do
    @api = Tumblife::Client.new
  end

  context :request do
    before do
    end

    it 'should get' do
      @api.should_receive(:request).with(:get, '/path/to', {:key1 => 'param1', :key2 => 'param2'}).and_return(create_response(200, 'OK'))
      @api.get('/path/to', :key1 => 'param1', :key2 => 'param2')
    end

    it 'should post' do
      @api.should_receive(:request).with(:post, '/path/to', {:key1 => 'param1', :key2 => 'param2'}).and_return(create_response(200, 'OK'))
      @api.post('/path/to', :key1 => 'param1', :key2 => 'param2')
    end
  end

  context :error do
    it 'should raise APIError' do
      pending

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
end
