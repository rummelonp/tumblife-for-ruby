require 'faraday'
require 'tumblife/error'

module Tumblife
  module Response
    class RaiseClientError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 400
          raise Tumblife::BadRequest.new(error_message(env))
        when 401
          raise Tumblife::NotAuthorized.new(error_message(env))
        when 404
          raise Tumblife::NotFound.new(error_message(env))
        when 400...500
          raise Tumblife::BadRequest.new(error_message(env))
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
        if body.nil?
          nil
        elsif body['meta'] && body['meta']['msg']
          body['meta']['msg']
        end
      end
    end
  end
end
