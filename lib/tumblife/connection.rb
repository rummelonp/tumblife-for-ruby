# -*- coding: utf-8 -*-

require 'faraday_middleware'
require 'tumblife/response'

module Tumblife
  module Connection
    # Returns a Faraday::Connection object
    def connection
      options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => user_agent
        },
        :proxy => proxy,
        :ssl => {
          :verify => false
        },
        :url => endpoint
      }

      Faraday.new(options) do |connection|
        connection.response :raise_server_error
        connection.response :raise_client_error
        connection.response :mashify
        connection.response :json
        connection.request :oauth, credentials
        connection.adapter adapter
      end
    end

    private
    def credentials
      {
        :consumer_key    => consumer_key,
        :consumer_secret => consumer_secret,
        :token           => oauth_token,
        :token_secret    => oauth_token_secret
      }
    end
  end
end
