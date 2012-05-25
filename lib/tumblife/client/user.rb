# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module User
      def info
        get('/v2/user/info')
      end

      def dashboard(options = {})
        get('/v2/user/dashboard', options)
      end

      def likes(offset = 0, limit = 20)
        get('/v2/user/likes', :offset => offset, :limit => limit)
      end

      def following(offset = 0, limit = 20)
        get('/v2/user/following', :offset => offset, :limit => limit)
      end

      def like(id, reblog_key)
        post('/v2/user/like', :id => id, :reblog_key => reblog_key)
      end

      def unlike(id, reblog_key)
        post('/v2/user/unlike', :id => id, :reblog_key => reblog_key)
      end

      def follow(url)
        post('/v2/user/follow', :url => url)
      end

      def unfollow(url)
        post('/v2/user/unfollow', :url => url)
      end
    end
  end
end

