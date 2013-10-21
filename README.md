nonen-rena-notification
============================

能年玲奈関係の情報をPUSH通知する

* 公式ブログ
* 事務所ニュース
* yahooニュース

# install

    $ bundle install

# use im.kayac.com

## copy configuration file

    $ cp config/account.yml.sample config/account.yml

## setting configuration

    username: "IM KAYAC COM USERNAME"
    password: "IM KAYAC COM PASSWORD"

# setting cron

example

    0 * * * * ruby /path/to/main.rb
