# frozen_string_literal: true

if ENV['RACK_ENV'] == 'development'
  APP_ROOT = Dir.getwd
  working_directory APP_ROOT
  stderr_path "#{APP_ROOT}/log/unicorn.stderr.log"

  OPTIONS_HASH = {
    # ipv6only: false,
    # tcp_nodelay: true,
    # tcp_nopush: true,
    backlog: 128
  }.freeze

  # see https://github.com/defunkt/unicorn/blob/v5.2.0/lib/unicorn/configurator.rb#L407
  listen 'localhost:4567', OPTIONS_HASH
  listen '127.0.0.1:4567', OPTIONS_HASH # send some data here
  listen 'localhost:9090', OPTIONS_HASH
  listen '127.0.0.1:9090', OPTIONS_HASH # or send some data here
  listen 'localhost:9091', OPTIONS_HASH
  listen '127.0.0.1:9091', OPTIONS_HASH # send some data here
  listen 'localhost:8125', OPTIONS_HASH
  listen '127.0.0.1:8125', OPTIONS_HASH # or send some data here
  # listen '/tmp/http_logger_app.unicorn.sock', *OPTIONS

  worker_processes 1
  timeout 20 # change timeout to 10000 for pry
end
