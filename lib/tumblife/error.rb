# -*- coding: utf-8 -*-

module Tumblife
  # Custom error class for rescuing from all Tumblr errors
  class APIError < StandardError
    attr_reader :response

    def initialize(msg, response = nil)
      super(msg)
      @response = response
    end
  end
end
