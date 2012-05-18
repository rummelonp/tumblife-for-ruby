# -*- coding: utf-8 -*-

module Tumblife
  module Request
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
  end
end
