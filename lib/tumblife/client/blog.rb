# coding: utf-8

module Tumblife
  class Client
    module Blog
      # Retrieve Blog Info
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-info
      # @authentication API Key
      # @param blog [String] The standard or custom blog hostname
      # @return [Hashie::Mash]
      def blog_info(blog)
        get("/v2/blog/#{blog}/info", :api_key => consumer_key)
      end

      # Retrieve a Blog Avatar
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-avatar
      # @authentication None
      # @param blog [String] The standard or custom blog hostname
      # @param size [Integer] The size of the avatar (square, one value for both length and width). Must be one of the values: 16, 24, 30, 40, 48, 64, 96, 128, 512
      # @return [Hashie::Mash]
      def avatar(blog, size = 64)
        get("/v2/blog/#{blog}/avatar", :size => size)
      end

      # Retrieve a Blog's Followers
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-followers
      # @authentication OAuth
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [Integer] :limit (20) The number of results to return: 1–20, inclusive
      # @option options [Integer] :offset (0) Result to start at
      # @return [Hashie::Mash]
      def followers(blog, options = {})
        get("/v2/blog/#{blog}/followers", options)
      end

      # Retrieve Published Posts
      #
      # @see http://www.tumblr.com/docs/en/api/v2#posts
      # @authentication API Key
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :type (nil) The type of post to return. Specify one of the following:  text, quote, link, answer, video, audio, photo, chat
      # @option options [Integer] :id (nil) A specific post ID. Returns the single post specified or (if not found) a 404 error.
      # @option options [String] :tag (nil) Limits the response to posts with the specified tag
      # @option options [Integer] :limit (20) The number of posts to return: 1–20, inclusive
      # @option options [Integer] :offset (0) Post number to start at
      # @option options [Boolean] :reblog_info (false) Indicates whether to return reblog information (specify true or false). Returns the various reblogged_ fields.
      # @option options [Boolean] :notes_info (false) Indicates whether to return notes information (specify true or false). Returns note count and note metadata.
      # @option options [String] :filter (nil) Specifies the post format to return, other than HTML: text – (Plain text, no HTML), raw – (As entered by the user (no post-processing); if the user writes in Markdown, the Markdown will be returned rather than HTML)
      # @return [Hashie::Mash]
      def posts(blog, options = {})
        options[:api_key] = consumer_key
        get("/v2/blog/#{blog}/posts", options)
      end

      # Retrieve Queued Posts
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-queue
      # @authentication OAuth
      # @param blog [String] The standard or custom blog hostname
      # @return [Hashie::Mash]
      def queue(blog)
        get("/v2/blog/#{blog}/posts/queue")
      end

      # Retrieve Draft Posts
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-drafts
      # @authentication OAuth
      # @param blog [String] The standard or custom blog hostname
      # @return [Hashie::Mash]
      def draft(blog)
        get("/v2/blog/#{blog}/posts/draft")
      end

      # Retrieve Submission Posts
      #
      # @see http://www.tumblr.com/docs/en/api/v2#blog-submissions
      # @authentication OAuth
      # @param blog [String] The standard or custom blog hostname
      # @return [Hashie::Mash]
      def submission(blog)
        get("/v2/blog/#{blog}/posts/submission")
      end
    end
  end
end
