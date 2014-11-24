The Scout Metrics Ruby Gem
====================
A Ruby wrapper for the Scout Metrics

Overview
------------
Scout Metrics is an application that tracks engagement on your website, as well as culminates data from the following sources into actionable statistics: Facebook, Twitter, Instagram, and Google Analytics.

This gem is used to help users of Scout Metrics give us data when their users engage in an action (such as commenting on a post, if you're hosting a blog), or when a new user signs up for their service.

Installation
------------
  gem install scoutmetrics

  Or include it in your application,
  gem 'scoutmetrics', '~> 0.0.3'

Usage
------------

When you sign up on Scout Metrics your site will be assigned a token, configure this gem to use that token as follows
```ruby
ScoutMetrics.configure do |config|
  config.access_token = MY_ACCESS_TOKEN
end
```

### User API (found in `/lib/scoutmetrics/user.rb`)
To tell us a user has signed up
`ScoutMetrics::User.find(user.id).signup`

Or if you wanted to backfill signups
```ruby
User.each do |user|
  ScoutMetrics::User.create(id: user.id, signup_date: user.created_at, return_date: user.latest_login, active: user.active?)
end
```

To tell us about their latest login (so we can track retention for you)
`ScoutMetrics::User.find(user.id).report_login`

### Engagement API (found in `/lib/scoutmetrics/engagement.rb`)
Tell us that one of your users commented on a post
`ScoutMetrics::Engagement.create("Commented on Post")`

Developers
------------------------------
This gem is developed by Must Win, LLC [http://mustwin.com]
