LunchWith Server
================

チームBDD LucnchWith のサーバーサイド

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.5
- Rails 4.1.5


Getting Started
---------------
```
$ cd LunchWith_Server
$ bundle install
```

### Setup DB

```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

### Setup cron

```
$ bundle exec whenever --update-cron
```

### Teardown cron

```
$ bundle exec whenever --clear-cron
```

API
---------------
see [wiki](wiki)