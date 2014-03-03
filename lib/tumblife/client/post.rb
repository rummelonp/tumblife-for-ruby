# coding: utf-8

module Tumblife
  class Client
    module Post
      # Create a New Blog Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#posting
      # @authentication OAuth
      # @note These parameters are used for {#text}, {#photo}, {#quote}, {#link}, {#chat}, {#audio}, {#video}, {#edit} and {#reblog} methods.
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :type ('text') The type of post to create. Specify one of the following:  text, photo, quote, link, chat, audio, video
      # @option options [String] :state ('published') The state of the post. Specify one of the following:  published, draft, queue
      # @option options [String] :tags (nil) Comma-separated tags for this post
      # @option options [String] :tweet (nil) Manages the autotweet (if enabled) for this post: set to off for no tweet, or enter text to override the default tweet
      # @option options [String] :date (nil) The GMT date and time of the post, as a string
      # @option options [Boolean] :markdown (false) Indicates whether the post uses markdown syntax
      # @option options [String] :slug (nil) Add a short text summary to the end of the post URL
      # @return [Hashie::Mash]
      def create_post(blog, options = {})
        post("/v2/blog/#{blog}/post", options)
      end

      # Create a New Text Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#ptext-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :title (nil) The optional title of the post, HTML entities must be escaped
      # @option options [String] :body (nil) The full post body, HTML allowed
      # @return [Hashie::Mash]
      def text(blog, options = {})
        create_post(blog, options.merge(:type => :text))
      end

      # Create a New Photo Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#pphoto-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :caption (nil) The user-supplied caption, HTML allowed
      # @option options [String] :link (nil) The "click-through URL" for the photo
      # @option options [String] :source (nil) The photo source URL
      # @option options [Faraday::UploadIO] :data (nil) One or more image files (submit multiple times to create a slide show)
      # @return [Hashie::Mash]
      def photo(blog, options = {})
        create_post(blog, options.merge(:type => :photo))
      end

      # Create a New Quote Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#pquote-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :quote (nil) The full text of the quote, HTML entities must be escpaed
      # @option options [String] :source (nil) Cited source, HTML allowed
      # @return [Hashie::Mash]
      def quote(blog, options = {})
        create_post(blog, options.merge(:type => :quote))
      end

      # Create a New Link Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#plink-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :title (nil) The title of the page the link points to, HTML entities should be escaped
      # @option options [String] :url (nil) The link
      # @option options [String] :description (nil) A user-supplied description, HTML allowed
      # @return [Hashie::Mash]
      def link(blog, options = {})
        create_post(blog, options.merge(:type => :link))
      end

      # Create a New Chat Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#ppt-convo
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :title (nil) The title of the chat
      # @option options [String] :conversation (nil) The text of the conversation/chat, with dialogue labels (no HTML)
      # @return [Hashie::Mash]
      def chat(blog, options = {})
        create_post(blog, options.merge(:type => :chat))
      end

      # Create a New Audio Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#paudio-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :caption (nil) The user-supplied caption
      # @option options [String] :external_url (nil) The URL of the site that hosts the audio file (not tumblr)
      # @option options [Faraday::UploadIO] :data (nil) An audio file
      # @return [Hashie::Mash]
      def audio(blog, options = {})
        create_post(blog, options.merge(:type => :audio))
      end

      # Create a New Video Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#pvideo-posts
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param options [Hash] An optional options hash
      # @option options [String] :caption (nil) The user-supplied caption
      # @option options [String] :embed (nil) HTML embed code for the video
      # @option options [Faraday::UploadIO] :data (nil) A video file
      # @return [Hashie::Mash]
      def video(blog, options = {})
        create_post(blog, options.merge(:type => :video))
      end

      # Edit a Blog Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#editing
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param id [Integer] The ID of the post to edit
      # @return [Hashie::Mash]
      def edit(blog, id, options = {})
        post("/v2/blog/#{blog}/post/edit", options.merge(:id => id))
      end

      # Reblog a Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#reblogging
      # @authentication OAuth
      # @note This parameter is in addition to the common parameters listed under {#create_post}
      # @param blog [String] The standard or custom blog hostname
      # @param id [Integer] The ID of the reblogged post on tumblelog
      # @param reblog_key [String] The reblog key for the reblogged post – get the reblog key with a {#posts} request
      # @param comment [String] A comment added to the reblogged post
      # @return [Hashie::Mash]
      def reblog(blog, id, reblog_key, comment = nil)
        options = {:id => id, :reblog_key => reblog_key}
        options[:comment] = comment if comment
        post("/v2/blog/#{blog}/post/reblog", options)
      end

      # Delete a Post
      #
      # @see http://www.tumblr.com/docs/en/api/v2#deleting-posts
      # @authentication OAuth
      # @param blog [String] The standard or custom blog hostname
      # @param id [Integer] The ID of the post to delete
      # @return [Hashie::Mash]
      def delete(blog, id)
        post("/v2/blog/#{blog}/post/delete", :id => id)
      end
    end
  end
end
