module Tumblife
  # Custom error class for rescuing from all Tumblr errors
  class Error < StandardError
  end

  # Raised when Tumblr returns the HTTP status code 4xx
  class BadRequest < Error
  end

  # Raised when Tumblr returns the HTTP status code 401
  class NotAuthorized < Error
  end

  # Raised when Tumblr returns the HTTP status code 404
  class NotFound < Error
  end

  # Raised when Tumblr returns the HTTP status code 5xx
  class InternalServerError < Error
  end

  # Raised when Tumblr returns the HTTP status code 503
  class ServiceUnavailable < Error
  end
end
