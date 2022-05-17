#!/usr/bin/env ruby

require 'socket'
include Socket::Constants

def udp_print_body(body)
  begin puts(JSON.pretty_generate(JSON.parse(body))); return nil; rescue StandardError; nil; end
  begin puts(URI.decode_www_form(body)); return nil; rescue StandardError; nil; end
  begin puts(XML.parse(body)); return nil; rescue StandardError; nil; end
  begin puts(body); return nil; rescue StandardError; nil; end

  puts("???") if body.present?
end

CUSTOM_UDP_HOST = "127.0.0.1"
CUSTOM_UDP_PORT = 8125
puts("Okay, we are listening on #{CUSTOM_UDP_PORT}")

# statsd printlog server
Socket.udp_server_loop(CUSTOM_UDP_HOST, CUSTOM_UDP_PORT) do |data, src|
  udp_print_body(data)
end
