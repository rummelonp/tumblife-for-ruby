# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module Blog
      def blog_info(blog)
        get("/v2/blog/#{blog}/info", :api_key => consumer_key)
      end

      def avatar(blog, size = 64)
        get("/v2/blog/#{blog}/avatar", :size => size)
      end

      def followers(blog, options = {})
        get("/v2/blog/#{blog}/followers", options)
      end

      def posts(blog, options = {})
        options[:api_key] = consumer_key
        get("/v2/blog/#{blog}/posts", options)
      end

      def queue(blog)
        get("/v2/blog/#{blog}/posts/queue")
      end

      def draft(blog)
        get("/v2/blog/#{blog}/posts/draft")
      end

      def submission(blog)
        get("/v2/blog/#{blog}/posts/submission")
      end
    end
  end
end
