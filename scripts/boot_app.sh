#!/usr/bin/env ruby

# What I typically use to debug

RACK_ENV=development bundle exec unicorn --config-file unicorn_conf.rb config.ru
