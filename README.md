
A development app to log incoming json requests

```shell
bundle install
RACK_ENV=development bundle exec thin start --port 3333 --rackup config.ru -a0.0.0.0 --debug --log -
```

On multiple ports

```shell
bundle install
RACK_ENV=development bundle exec unicorn --config-file unicorn_conf.rb
```

for developing

```shell
RACK_ENV=development bundle exec rackup config.ru --port 4567
```
