
## see also


https://gitlab.com/kennethreitz/httpbin/-/tree/master/httpbin

`docker run -p 4567:80 -p 9090:80 kennethreitz/httpbin`

https://github.com/mendhak/docker-http-https-echo
https://hub.docker.com/r/mendhak/http-https-echo

`docker run -p 9090:80 -p 9443:443 --rm -t mendhak/http-https-echo`

## A development app to log incoming requests

boot on multiple ports

```shell
bundle install
RACK_ENV=development bundle exec unicorn --config-file unicorn_conf.rb config.ru
# if you have trouble booting unicorn try
cat log/*
```

boot on thin

```shell
bundle install
RACK_ENV=development bundle exec thin start --port 4567 --rackup config.ru -a0.0.0.0 --debug --log -
```

for developing

```shell
RACK_ENV=development bundle exec rackup config.ru --port 4567
```
