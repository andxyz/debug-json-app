puts "RACK_ENV: #{ENV["RACK_ENV"]}"

Bundler.require(:default, ENV.fetch('RACK_ENV', 'development')) if defined?(Bundler)

require './debug_app'

run ::DebugApp.new()
