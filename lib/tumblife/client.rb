# -*- coding: utf-8 -*-


module Tumblife
  # Wrapper for the Tumblr REST API
  class Client < API
    require 'tumblife/client/blog'
    include Blog

    require 'tumblife/client/user'
    include User
  end
end
