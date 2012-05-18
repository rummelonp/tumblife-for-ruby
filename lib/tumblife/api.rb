# -*- coding: utf-8 -*-

require 'tumblife/connection'
require 'tumblife/request'

module Tumblife
  class API
    include Connection
    include Request

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options = {})
      options = Tumblife.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
