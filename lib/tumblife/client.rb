require 'tumblife/connection'
require 'tumblife/request'
require 'tumblife/client/blog'
require 'tumblife/client/post'
require 'tumblife/client/user'

module Tumblife
  # Wrapper for the Tumblr REST API
  class Client
    include Connection
    include Request
    include Blog
    include Post
    include User

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
