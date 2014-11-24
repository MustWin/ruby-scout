;(function ($, window, document, undefined ) {
  "use strict";

  var ScoutMetrics = {
    accessToken: '6qPPlrlPYk5erffdy7cgig',
    Request: {
      init: function() {
        this.api_domain = 'https://scoutmetrics.herokuapp.com/api/v1';
      },
      send: function(method, route, data, callback) {
        var self = this;
        var url = self.api_domain + route

        data['token'] = ScoutMetrics.accessToken;
        $.ajax({
          url: self.api_domain + route,
          type: method,
          data: data,
          complete: function(response) {
            callback(response, 'NOTHING');
          }
        });
      }
    },
    User: {
      create: function(id, signup_date, callback) {
        signup_date || (signup_date = new Date());
        this.postUpdate(id, { app_user: { signup_date: signup_date } }, callback);
      },
      update: function(id, return_date, callback) {
        return_date || (return_date = new Date());
        this.postUpdate(id, { app_user: { return_date: return_date } }, callback);
      },
      activate: function(id, callback) {
        this.postUpdate(id, { active: true }, callback);
      },
      deactivate: function(id, callback) {
        this.postUpdate(id, { active: false }, callback);
      },
      postUpdate: function(id, params, callback) {
        ScoutMetrics.Request.send('POST', '/app_users/' + id, params, callback);
      }
    },
    Engagement: {
      create_category: function(name, callback) {
        ScoutMetrics.Request.send('POST', '/engagements', { engagement: { name: name } }, callback);
      },
      create: function(name, date_recorded, callback) {
        date_recorded || (date_recorded = new Date());
        var params = { engagement: { name: name },
                       engagement_instance: { date_recorded: date_recorded } };
        ScoutMetrics.Request.send('POST', '/engagements/add_instance', params, callback);
      }
    }
  };

  ScoutMetrics.Request.init();

  window.ScoutMetrics = ScoutMetrics;

})(jQuery,window,document);