# -*- coding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tumblife::API do
  before do
    @api = Tumblife::API.new
  end

  context :error do
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
