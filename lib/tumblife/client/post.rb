# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module Post
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
