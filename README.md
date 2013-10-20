nonen-rena-blog-notification
============================

能年玲奈のブログに更新があったらPUSH通知する

# install

    $ bundle install

# use im.kayac.com

## move configuration file

    $ mv config.yml.sample config.yml

## setting configuration

    username: "IM KAYAC COM USERNAME"
    password: "IM KAYAC COM PASSWORD"

# setting cron

    0 0,8-23 * * * ruby /path/to/main.rb
