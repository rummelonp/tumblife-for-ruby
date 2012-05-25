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

      def create_post(blog, options = {})
        post("/v2/blog/#{blog}/post", options)
      end

      def edit(blog, id, options = {})
        post("/v2/blog/#{blog}/post/edit", options.merge(:id => id))
      end

      def reblog(blog, id, reblog_key, comment = nil)
        options = {:id => id, :reblog_key => reblog_key}
        options[:comment] = comment if comment
        post("/v2/blog/#{blog}/post/reblog", options)
      end

      def delete(blog, id)
        post("/v2/blog/#{blog}/post/delete", :id => id)
      end
    end
  end
end
