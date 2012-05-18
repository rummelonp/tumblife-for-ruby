# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module Blog
      def info(blog, options = {})
        options = {:api_key => consumer_key}.merge(options)
        get("/v2/blog/#{blog}/info", options)
      end

      def avatar(blog, options = {})
        get("/v2/blog/#{blog}/avatar", options)
      end

      def followers(blog, options = {})
        get("/v2/blog/#{blog}/followers", options)
      end

      def posts(blog, options = {})
        options = {:api_key => consumer_key}.merge(options)
        get("/v2/blog/#{blog}/posts", options)
      end

      def queue(blog, options = {})
        get("/v2/blog/#{blog}/posts/queue", options)
      end

      def draft(blog, options = {})
        get("/v2/blog/#{blog}/posts/draft", options)
      end

      def submission(blog, options = {})
        get("/v2/blog/#{blog}/posts/submission", options)
      end

      def create_post(blog, options = {})
        post("/v2/blog/#{blog}/post", options)
      end

      def edit_post(blog, options = {})
        post("/v2/blog/#{blog}/post/edit", options)
      end

      def reblog_post(blog, options = {})
        post("/v2/blog/#{blog}/post/reblog", options)
      end

      def delete_post(blog, options = {})
        post("/v2/blog/#{blog}/post/delete", options)
      end
    end
  end
end
