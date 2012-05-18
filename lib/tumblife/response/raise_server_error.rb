# -*- coding: utf-8 -*-

require 'faraday'
require 'tumblife/error'

module Tumblife
  module Response
    class RaiseServerError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 500
          raise Tumblife::InternalServerError.new(error_message(env))
        when 503
          raise Tumblife::ServiceUnavailable.new(error_message(env))
        when 500...600
          raise Tumblife::InternalServerError.new(error_message(env))
        end
      end

      private
      def error_message(env)
        [
         env[:method].to_s.upcase,
         env[:url].to_s,
         env[:status],
         error_body(env[:body])
        ].join(': ')
      end

      def error_body(body)
        if body['meta'] && body['meta']['msg']
          body['meta']['msg']
        end
      end
    end
  end
end
