# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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

# Learn more: http://github.com/javan/whenever

# for development and to test whenever use this:
# set :environment, :development
# if deploying to heroku use heroku's scheduler

# this is my final setup
every 1.day, :at => '9:00 am' do
  rake "todo:delete_todos"
end

# this is my test setup
# every 7.minutes do
#   rake "todo:delete_todos"
# end


# to run whenever
# whenever -w       # type
# [write] crontab file written    # response
# check to see if it is working; use shorter time frame for testing

# to stop whenever
# use :
# whenever -c theCronJob    # if this does not work  try
# crontab -r    # this worked

# You can also try the command    whenever clear
