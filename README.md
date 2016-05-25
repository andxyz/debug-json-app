
A development app to log incoming json requests

```shell
bundle install
RACK_ENV=development bundle exec thin start --rackup config.ru -a0.0.0.0 -p3000 --debug --log -
```
