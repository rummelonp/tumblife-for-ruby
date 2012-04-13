# -*- coding: utf-8 -*-

require 'oauth'
require 'json'
require 'cgi'

module Tumblife
  # Wrapper for the Tumblr REST API
  class Client < API
    # method name, path for API,         authentication, http method
    "
      info         /v2/blog/%s/info             api_key
      avatar       /v2/blog/%s/avatar           none
      followers    /v2/blog/%s/followers        oauth
      posts        /v2/blog/%s/posts            api_key
      queue        /v2/blog/%s/posts/queue      oauth
      draft        /v2/blog/%s/posts/draft      oauth
      submission   /v2/blog/%s/posts/submission oauth
      create_post  /v2/blog/%s/post             oauth   post
      edit_post    /v2/blog/%s/post/edit        oauth   post
      reblog_post  /v2/blog/%s/post/reblog      oauth   post
      delete_post  /v2/blog/%s/post/delete      oauth   post
      dashboard    /v2/user/dashboard           oauth
      likes        /v2/user/likes               oauth
      following    /v2/user/following           oauth
      follow       /v2/user/follow              oauth   post
      unfollow     /v2/user/unfollow            oauth   post
      info_user    /v2/user/info                oauth
    ".strip.split("\n").map {|l| l.strip.split(/\s+/)}.each do |api|
      method_name, path, auth, http_method = *api
      http_method ||= 'get'
      if /%s/ =~ path
        define_method method_name do |*args|
          params = args.last.kind_of?(Hash) ? args.pop : {}
          params[:api_key] = api_key if auth == 'api_key'
          send http_method, path % args, params
        end
      else
        define_method method_name do |*args|
          params = args.first || {}
          send http_method, path, params
        end
      end
    end
  end
end
