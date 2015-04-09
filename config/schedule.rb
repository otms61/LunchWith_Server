set :output, error: 'log/error.log', standard: 'log/cron.log'
every 1.minute do
  rake 'coupon:check_limit'
end
