###
# log post requests that hopefully send json
#
# RACK_ENV=development bundle exec thin start config.ru -a0.0.0.0 -p3000 --debug --log -
#
require 'json'
require 'logger'
require 'sinatra/base'
# require 'sinatra/multi_route'

class DebugApp < Sinatra::Base
  configure do
    set :raise_errors, true
    set :dump_errors, false
    set :show_exceptions, false
    use Rack::BounceFavicon
  end

  get '/health_check' do
    set_response_headers

    [200, {}, ['this is the debug app']]
  end

  post '/*' do
    set_response_headers

    puts("#{request.url}#{request.query_string}")
    puts("## headers")
    request.env.slice(*header_keys_to_display).map do |k, v|
      puts("#{k}: #{v}")
    end
    puts("## body")
    output = JSON.pretty_generate(JSON.parse(request.body.read)) rescue request.body.read
    puts(output)
    puts("\n")

    [200, {}, ['']]
  end

  private

  def header_keys_to_display
    @good_keys ||= [
      "HTTP_USER_AGENT",
    ]
  end

  def set_response_headers
    response.headers['X-app-name'] = 'debug_app'
  end
end
