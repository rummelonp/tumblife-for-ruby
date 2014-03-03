require 'tumblife/version'
require 'tumblife/error'
require 'tumblife/configuration'
require 'tumblife/client'

module Tumblife
  extend Configuration

  # Alias for Tumblife::Client.new
  #
  # @return [Tumblife::Client]
  def self.client(options = {})
    Tumblife::Client.new(options)
  end

  # Delegate to {Tumblife::Client}
  def self.method_missing(method_name, *args, &block)
    return super unless client.respond_to?(method_name)
    client.send(method_name, *args, &block)
  end

  # Delegate to {Tumblife::Client}
  def self.respond_to?(method_name, include_private = false)
    return client.respond_to?(method_name, include_private) || super
  end
end
