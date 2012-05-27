# Tumblife [![Build Status](https://secure.travis-ci.org/mitukiii/tumblife-for-ruby.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/mitukiii/tumblife-for-ruby.png?travis)][gemnasium]
[travis]: http://travis-ci.org/mitukiii/tumblife-for-buy
[gemnasium]: https://gemnasium.com/mitukiii/tumblife-for-ruby

A Ruby wrapper for the Tumblr API v2.

## Installation
    gem install tumblife

## Usage
```ruby
require 'tumblife'

Tumblife.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end
    
client = Tumblife.client
    
avatar = client.avatar('mitukiii.tumblr.com')
avatar.avatar_url # => http://24.media.tumblr.com/avatar_87fdfd3ea0e3_64.png
    
info = client.blog_info('mitukiii.tumblr.com')
info.blog.name # => mitukiii
info.blog.url # => http://mitukiii.tumblr.com/
    
dashboard = client.dashboard
dashboard.posts.each do |post|
  # ... do something
end

client.text('mitukiii.tumblr.com', :body => 'Hello, Tumblr!')
client.photo('mitukiii.tumblr.com', :data => Faraday::UploadIO.new('/path/to/image.png', 'image/png'))
```

## TODO
* better post support
* better test

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright
Copyright (c) 2011 [Kazuya Takeshima](mailto:mail@mitukiii.jp). See [LICENSE][] for details.

[license]: https://github.com/mitukiii/tumblife-for-ruby/blob/master/LICENSE.md
