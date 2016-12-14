if ENV["RACK_ENV"] == "development"
  APP_ROOT = Dir.getwd
  BACKLOG_SIZE = 4096
  working_directory APP_ROOT
  stderr_path APP_ROOT + "/log/unicorn.stderr.log"

  listen "127.0.0.1:4567", tcp_nopush: true, :backlog => BACKLOG_SIZE # fake pulse
  listen "127.0.0.1:9090", tcp_nopush: true, :backlog => BACKLOG_SIZE # other
  listen '/tmp/http_logger_app.unicorn.sock', :backlog => BACKLOG_SIZE

  worker_processes 10
  timeout 20 # change timeout to 10000 for pry
end
