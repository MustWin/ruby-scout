require 'scoutmetrics/configuration'
require 'scoutmetrics/engagement'
require 'scoutmetrics/request'
require 'scoutmetrics/user'

module ScoutMetrics
  extend Configuration

end
# Configure in your initializer as such
#
# ScoutMetrics.configure do |config|
#   config.access_token = SCOUT_PROJECT_TOKEN
# end
#
# Add a new User
# ScoutMetrics::User.create({ app_id: user.id, signup_date: DateTime.current })
# 
# Update an existing User
# ScoutMetrics::User.update({ app_id: user.id, return_date: DateTime.current })
#
# Add an engagement
# ScoutMetrics::Engagement.create({ name: 'Liked us on Facebook' })
#
# Report an engagement
# ScoutMetrics::Engagement.report({ name: 'Liked us on Facebook' }, DateTime.current)