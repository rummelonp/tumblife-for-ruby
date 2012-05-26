# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module Post
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

      def text(blog, options = {})
        create_post(blog, options.merge(:type => :text))
      end

      def photo(blog, options = {})
        create_post(blog, options.merge(:type => :photo))
      end

      def quote(blog, options = {})
        create_post(blog, options.merge(:type => :quote))
      end

      def link(blog, options = {})
        create_post(blog, options.merge(:type => :link))
      end

      def chat(blog, options = {})
        create_post(blog, options.merge(:type => :chat))
      end

      def audio(blog, options = {})
        create_post(blog, options.merge(:type => :audio))
      end

      def video(blog, options = {})
        create_post(blog, options.merge(:type => :video))
      end

      private
      def create_post(blog, options = {})
        post("/v2/blog/#{blog}/post", options)
      end
    end
  end
end
