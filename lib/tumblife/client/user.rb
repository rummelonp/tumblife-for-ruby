# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module User
      # Get a User's Information
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-up-info
      # @authentication OAuth
      # @return [Hashie::Mash]
      def info
        get('/v2/user/info')
      end

      # Retrieve a User's Dashboard
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-ug-dashboard
      # @authentication OAuth
      # @param options [Hash] An optional options hash
      # @option options [Integer] :limit (20) The number of results to return: 1–20, inclusive
      # @option options [Integer] :offset (0) Post number to start at
      # @option options [String] :type (nil) The type of post to return. Specify one of the following: text, photo, quote, link, chat, audio, video, answer
      # @option options [Integer] :since_id (0) Return posts that have appeared after this ID (Use this parameter to page through the results: first get a set of posts, and then get posts since the last ID of the previous set.)
      # @option options [Boolean] :reblog_info (false) Indicates whether to return reblog information (specify true or false). Returns the various reblogged_ fields.
      # @option options [Boolean] :notes_info (false) Indicates whether to return notes information (specify true or false). Returns note count and note metadata.
      # @return [Hashie::Mash]
      def dashboard(options = {})
        get('/v2/user/dashboard', options)
      end

      # Retrieve a User's Likes
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-ug-likes
      # @authentication OAuth
      # @param offset [Integer] Liked post number to start at
      # @param limit [Integer] The number of results to return: 1–20, inclusive
      # @return [Hashie::Mash]
      def likes(offset = 0, limit = 20)
        get('/v2/user/likes', :offset => offset, :limit => limit)
      end

      # Retrieve the Blogs a User Is Following
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-ug-following
      # @authentication OAuth
      # @param offset [Integer] Result number to start at
      # @param limit [Integer] The number of results to return: 1–20, inclusive
      # @return [Hashie::Mash]
      def following(offset = 0, limit = 20)
        get('/v2/user/following', :offset => offset, :limit => limit)
      end

      # Like a Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-up-like
      # @authentication OAuth
      # @param id [Integer] The ID of the post to like
      # @param reblog_key [String] The reblog key for the post id
      # @return [Hashie::Mash]
      def like(id, reblog_key)
        post('/v2/user/like', :id => id, :reblog_key => reblog_key)
      end

      # Unlike a Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-up-unlike
      # @authentication OAuth
      # @param id [Integer] The ID of the post to unlike
      # @param reblog_key [String] The reblog key for the post id
      # @return [Hashie::Mash]
      def unlike(id, reblog_key)
        post('/v2/user/unlike', :id => id, :reblog_key => reblog_key)
      end

      # Follow a blog
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-up-follow
      # @authentication OAuth
      # @param url [String] The URL of the blog to follow
      # @return [Hashie::Mash]
      def follow(url)
        post('/v2/user/follow', :url => url)
      end

      # Unfollow a blog
      #
      # @see http://www.tumblr.com/docs/en/api/v2#m-up-unfollow
      # @authentication OAuth
      # @param url [String] The URL of the blog to unfollow
      # @return [Hashie::Mash]
      def unfollow(url)
        post('/v2/user/unfollow', :url => url)
      end
    end
  end
end

