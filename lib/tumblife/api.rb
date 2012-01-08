# -*- coding: utf-8 -*-

require 'oauth'
require 'json'
require 'hashie'

require 'active_support/core_ext/object/to_query'
require 'active_support/core_ext/hash/keys'

module Tumblife
  class API
    # @private
    attr_accessor *Configuration::OPTIONS_KEYS

    # Creates a new API
    def initialize(options = {})
      options = Tumblife.options.merge(options)
      Configuration::OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Perform an HTTP GET request
    def get(path, params = {})
      response = access_token.get(path + '?' + params.to_param, header)
      parse_response(response)
    end

    # Perform an HTTP POST request
    def post(path, params = {})
      response = access_token.post(path, params.stringify_keys, header)
      parse_response(response)
    end

    alias_method :api_key, :consumer_key

    # Create a new consumer
    def consumer
      OAuth::Consumer.new(consumer_key, consumer_secret, :site => endpoint)
    end

    # Create a new access token
    def access_token
      OAuth::AccessToken.new(consumer, oauth_token, oauth_token_secret)
    end

    def header
      {'User-Agent' => user_agent}
    end

    def parse_response(res)
      json = Hashie::Mash.new(JSON.parse(res.body))
      case json.meta.status.to_i
      when 400...600
        raise APIError.new(json.meta.msg, res)
      else
        json.response
      end
    end
  end
end
