# -*- coding: utf-8 -*-

require 'faraday'
require 'tumblife/response/raise_client_error'
require 'tumblife/response/raise_server_error'

Faraday.register_middleware :response,
  :raise_client_error => lambda { Tumblife::Response::RaiseClientError },
  :raise_server_error => lambda { Tumblife::Response::RaiseServerError }
