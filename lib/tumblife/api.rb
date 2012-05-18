# -*- coding: utf-8 -*-

require 'faraday_middleware'

module Tumblife
  class API
    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options = {})
      options = Tumblife.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Perform an HTTP GET request
    def get(path, params = {})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params = {})
      request(:post, path, params)
    end

    # Perform an HTTP request
    def request(http_method, path, params = {})
      response = connection.send(http_method) do |request|
        case http_method
        when :get, :delete
          request.url(path, params)
        when :post, :put
          request.path = path
          request.body = params unless params.empty?
        end
      end

      response.body
    end

    # @private
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
