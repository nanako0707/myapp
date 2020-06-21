# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
ENV.each { |k, v| env(k, v) }
set :output, error: 'log/crontab_error.log', standard: "log/cron.log"
set :enviroment, :development
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# every :friday, at: '8:30 am' do
#   runner "SurgicalOperationMailer.notify_user"
# end

every 1.minutes do
  runner "SurgicalOperationMailer.notify_user"
end

# Learn more: http://github.com/javan/whenever
