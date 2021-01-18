puts "RACK_ENV: #{ENV.fetch('RACK_ENV', 'development')}"

require 'bundler/setup'
require 'bootsnap'
env = ENV['RACK_ENV'] || "development"
Bootsnap.setup(
  cache_dir:            'tmp/cache',          # Path to your cache
  development_mode:     env == 'development', # Current working environment, e.g. RACK_ENV, RAILS_ENV, etc
  load_path_cache:      true,                 # Optimize the LOAD_PATH with a cache
  autoload_paths_cache: true,                 # Optimize ActiveSupport autoloads with cache
  disable_trace:        true,                 # Set `RubyVM::InstructionSequence.compile_option = { trace_instruction: false }`
  compile_cache_iseq:   true,                 # Compile Ruby code into ISeq cache, breaks coverage reporting.
  compile_cache_yaml:   true                  # Compile YAML into a cache
)

Bundler.require(:default, ENV.fetch('RACK_ENV', 'development')) if defined?(Bundler)

require './debug_app'

run ::DebugApp.new()
