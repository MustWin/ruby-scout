;(function ($, window, document, undefined ) {
  "use strict";

  var ScoutMetrics = {
    accessToken: '6qPPlrlPYk5erffdy7cgig'
    Request: {
      init: function() {
        this.domain = 'https://scoutmetrics.com/api/v1'
      },
      send: function(method, route, data) {
        var self = this;
        data['token'] = ScoutMetrics.accessToken;
        $.ajax({
          url: self.domain + route,
          type: method,
          data: data
        });
      }
    },
    User: {
      create: function(params) {
        params['signup_date'] || (params['signup_date'] = new Date());
        Request.send('POST', '/app_users', { app_user: params });
      },
      update: function(params) {
        params['return_date'] || (params['return_date'] = new Date());
        Request.send('POST', '/app_users', { app_user: params });
      }
    },
    Engagement: {
      create: function(params) {
        Request.send('POST', '/engagements', { engagement: params });
      },
      report: function(engagement_params, date_recorded) {
        date_recorded || (date_recorded = new Date());
        params = { engagement: engagement_params,
                   engagement_instance: { date_recorded: date_recorded } };
        Request.send('POST', '/engagements/add_instance', params);
      }
    }
  };

  window.ScoutMetrics = ScoutMetrics;

})(jQuery,window,document);