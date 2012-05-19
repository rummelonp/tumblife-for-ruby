# -*- coding: utf-8 -*-

require 'spec_helper'

describe Faraday::Response do
  let(:client) { Tumblife.client }

  {
    400 => Tumblife::BadRequest,
    401 => Tumblife::NotAuthorized,
    404 => Tumblife::NotFound,
    499 => Tumblife::BadRequest,
    500 => Tumblife::InternalServerError,
    503 => Tumblife::ServiceUnavailable,
    599 => Tumblife::InternalServerError,
  }.each do |status, exception|
    context "when HTTP status is #{status}" do
      before do
        stub_get('/v2/user/dashboard').
          to_return(:status => status, :body => '{"meta":{"msg":"test"}}')
      end

      it "should raise #{exception.name} error" do
        lambda {
          client.dashboard
        }.should raise_error(exception)
      end
    end
  end
end
