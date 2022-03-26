env :PATH, ENV['PATH']
set :environment, ENV['RAILS_ENV']
set :output, error: 'log/cron_error.log', standard: 'log/cron.log'

every 1.day do
  rake "mails:event_deadline"
end
