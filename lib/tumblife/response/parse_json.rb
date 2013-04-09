# -*- coding: utf-8 -*-

require 'faraday'
require 'yajl'

module Tumblife
  module Response
    class ParseJson < Faraday::Response::Middleware
      def on_complete(env)
        env[:body] = parse_body(env[:body])
      end

      def parse_body(body)
        if body.nil?
          nil
        else
          Yajl.load(body)
        end
      end
    end
  end
end
