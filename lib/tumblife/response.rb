# -*- coding: utf-8 -*-

require 'faraday'
require 'tumblife/response/parse_json'
require 'tumblife/response/raise_client_error'
require 'tumblife/response/raise_server_error'

Faraday.register_middleware :response,
  :json               => lambda { Tumblife::Response::ParseJson },
  :raise_client_error => lambda { Tumblife::Response::RaiseClientError },
  :raise_server_error => lambda { Tumblife::Response::RaiseServerError }
