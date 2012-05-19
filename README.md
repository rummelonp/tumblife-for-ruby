# Tumblife [![Build Status](https://secure.travis-ci.org/mitukiii/tumblife-for-ruby.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/mitukiii/tumblife-for-ruby.png?travis)][gemnasium]

[travis]: http://travis-ci.org/mitukiii/tumblife-for-buy
[gemnasium]: https://gemnasium.com/mitukiii/tumblife-for-ruby

Tumblife is a simple Tumblr API v2 library.

## Install

    $ gem install tumblife

## Example

    require 'tumblife'

    Tumblife.configure do |config|
      config.consumer_key = '*** consumer key ***',
      config.consumer_secret = '*** consumer secret ***',
      config.oauth_token = '*** oauth token ***',
      config.oauth_token_secret = '*** oauth token secret ***'
    end
    
    client = Tumblife.client
    
    avatar = client.avatar('mitukiii.tumblr.com')
    avatar.avatar_url # => http://24.media.tumblr.com/avatar_87fdfd3ea0e3_64.png
    
    info = client.info('mitukiii.tumblr.com')
    info.blog.name # => mitukiii
    info.blog.url # => http://mitukiii.tumblr.com/
    
    dashboard = client.dashboard
    dashboard.posts.each do |post|
      # ... do something
    end
    

## Requirement

    faraday
    faraday_middleware
    simple_oauth
    json
    hashie

## Copyright

Released under the MIT license: http://www.opensource.org/licenses/MIT

