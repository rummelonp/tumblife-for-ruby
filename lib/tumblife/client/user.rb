# -*- coding: utf-8 -*-

module Tumblife
  class Client
    module User
      def dashboard(options = {})
        get("/v2/user/dashboard", options)
      end

      def likes(options = {})
        get("/v2/user/likes", options)
      end

      def following(options = {})
        get("/v2/user/following", options)
      end

      def follow(options = {})
        post("/v2/user/follow", options)
      end

      def unfollow(options = {})
        post("/v2/user/unfollow", options)
      end

      def info_user(options = {})
        get("/v2/user/info", options)
      end
    end
  end
end

